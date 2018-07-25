# 项目更新
# 1、拉取代码
# 2、创建新镜像
# 		a、查看是镜像进程，如果存在
# 			1、暂停进程
# 			2、移除镜像
# 		b、构建新镜像
# 		c、运行镜像
#!/bin/bash
image=$1
containerID=`docker ps -a | grep $1 | awk '{print $1}'`
echo  "当前镜像进程: ${containerID}"
echo  "构建镜像名称: ${image}"

# 拉取代码
git pull
echo "拉取代码完毕"
	
# 如果进程存在	
# 	杀死进程
# 	移除镜像
if [ -n "$containerID" ]; then 
    docker stop ${containerID}
    docker rm ${containerID}
    imageID=`docker images | grep $1 | awk '{print $3}'`
    docker rmi ${imageID}
fi

# 构建镜像
docker build -t $1 .

# 运行镜像
docker run -d -p 80:3000 $1

