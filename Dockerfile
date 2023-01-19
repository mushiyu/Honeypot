FROM golang:1.17.13-alpine
#定义工作目录环境变量
ENV work_dir=/root/sec-dev-in-action-src
#从本地目录拷贝源代码
COPY sec-dev-in-action-src $work_dir
#安装gcc编译
RUN apk add -U --no-cache gcc g++ make libffi-dev openssl-dev libpcap-dev libtool \ 
    && cd $work_dir/honeypot/agent/ \
    && go mod tidy \
    && go build main.go \
    && cd $work_dir/honeypot/log_server/ \
    && go mod tidy \
    && go build main.go \
    && cd $work_dir/honeypot/server/ \
    && go mod tidy \
    && go build main.go \


