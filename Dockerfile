FROM golang:latest
RUN mkdir -p $GOPATH/src/github.com/hashicorp && cd $GOPATH/src/github.com/hashicorp \
   && git clone https://github.com/hashicorp/packer.git && cd packer \
   && make dev
WORKDIR /usr/src/
COPY . .
ENV aws_access_key_id ${AWS_ACCESS_KEY_ID}
ENV aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}
ENV aws_region ${AWS_REGION}
ENV vpc_id ${VPC_ID}
ENV subnet_id ${SUBNET_ID}
