#include "mapreadandwrite.h"
#include <stdio.h>
#include <fstream>
#include <cstdlib>
#include "yaml-cpp/yaml.h"

namespace zw {

bool readPgm(nav_msgs::OccupancyGrid& grid,const std::string file_path)
{
  std::ifstream pgm_file(file_path, std::ios::in | std::ios::binary);
  const int MAX=100;
  char header[MAX];
  pgm_file.getline(header,MAX);
  if(header[1]!='5')
  {
    ROS_ERROR("we need .pgm of P5");
    pgm_file.close();
    return false;
  }
  pgm_file.getline(header,MAX);
  pgm_file.getline(header,MAX);
  char *w=strtok(header," ");
  grid.info.width = (unsigned int)atoi(w);
  char *h=strtok(NULL,"\n");
  grid.info.height = (unsigned int)atoi(h);
  ROS_INFO("map.width=%d, map.height=%d",grid.info.width,grid.info.height);
  pgm_file.getline(header,MAX);
  unsigned long dat_size=grid.info.width*grid.info.height;
  grid.data.resize(dat_size,-1);
  char *dat=new char[dat_size];
  pgm_file.read(dat,dat_size);
  constexpr uint8_t kUnknownValue = 128;
  size_t j=0;
  for (size_t y = 0; y < grid.info.height; ++y) {
    for (size_t x = 0; x < grid.info.width; ++x) {
      const size_t i = x + (grid.info.height - y - 1) * grid.info.width;
      grid.data[i]=100-((unsigned char)dat[j++]*100)/255;
    }
  }
  delete dat;
  pgm_file.close();
  //OccupancyToPgmAndYaml(grid,"/home/zw/zw");
  return true;
}

void WriteOccupancyGridToPgm(const ::nav_msgs::OccupancyGrid& grid,
                             const std::string& filename)
{
    std::ofstream pgm_file(filename, std::ios::out | std::ios::binary);
    const std::string header = "P5\n# Cartographer map; " +
                               std::to_string(grid.info.resolution) +
                               " m/pixel\n" + std::to_string(grid.info.width) +
                               " " + std::to_string(grid.info.height) + "\n255\n";
    pgm_file.write(header.data(), header.size());
    for (size_t y = 0; y < grid.info.height; ++y) {
      for (size_t x = 0; x < grid.info.width; ++x) {
        const size_t i = x + (grid.info.height - y - 1) * grid.info.width;
        if (grid.data[i] >= 0 && grid.data[i] <= 100) {
          pgm_file.put((100 - grid.data[i]) * 255 / 100);
        } else {
          // We choose a value between the free and occupied threshold.
          constexpr uint8_t kUnknownValue = 128;
          pgm_file.put(kUnknownValue);
        }
      }
    }
    pgm_file.close();
}

bool PgmAndYamlToOccupancy(nav_msgs::OccupancyGrid& grid,const std::string& stem)
{
  const std::string yaml_filename =stem +".yaml";
  if(access(yaml_filename.c_str(),0)==-1)
  {
    ROS_ERROR("%s does not exist.",yaml_filename.c_str());
    return false;
  }
  YAML:: Node config =YAML::LoadFile(yaml_filename);
  if(config["resolution"])
  {
    grid.info.resolution=config["resolution"].as<float>();
    ROS_INFO("map resolution=%f",grid.info.resolution);
  }
  if(config["origin"]){
    grid.info.origin.position.x=config["origin"][0].as<double>();
    grid.info.origin.position.y=config["origin"][1].as<double>();
    grid.info.origin.position.z=config["origin"][2].as<double>();
    ROS_INFO("origin.x=%f, origin.y=%f, origin.z=%f",grid.info.origin.position.x,
             grid.info.origin.position.y,
             grid.info.origin.position.z);
  }
  const std::string map_filename =stem +".pgm";
  if(access(map_filename.c_str(),0)==-1)
  {
    ROS_ERROR("%s does not exist.",map_filename.c_str());
    return false;
  }
  readPgm(grid,map_filename);

  return true;
}

void OccupancyToPgmAndYaml(nav_msgs::OccupancyGrid& grid,const std::string& stem)
{
  const std::string map_filename = stem + ".pgm";
  WriteOccupancyGridToPgm(grid, map_filename);
  const std::string yaml_filename = stem + ".yaml";
  std::ofstream yaml_file(yaml_filename, std::ios::out | std::ios::binary);
  {
     YAML::Emitter out(yaml_file);
     out << YAML::BeginMap;
     // TODO(whess): Use basename only?
     out << YAML::Key << "image" << YAML::Value << map_filename;
     out << YAML::Key << "resolution" << YAML::Value << grid.info.resolution;
     // According to map_server documentation "many parts of the system currently
     // ignore yaw" so it is good we use a zero value.
     constexpr double kYawButMaybeIgnored = 0.;
     out << YAML::Key << "origin" << YAML::Value << YAML::Flow << YAML::BeginSeq
         << grid.info.origin.position.x << grid.info.origin.position.y
         << kYawButMaybeIgnored << YAML::EndSeq;
     out << YAML::Key << "occupied_thresh" << YAML::Value << 0.51;
     out << YAML::Key << "free_thresh" << YAML::Value << 0.49;
     out << YAML::Key << "negate" << YAML::Value << 0;
     out << YAML::EndMap;
   }
   yaml_file.close();
}

}
