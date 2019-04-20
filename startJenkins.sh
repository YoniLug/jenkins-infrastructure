JENKINS_DATA_VOLUME=$1
JENKINS_CONTAINER_NAME=$2
JENKINS_SERVER_HOST=$3

if ! [ -d ${JENKINS_DATA_VOLUME} ] ; then
    mkdir ${JENKINS_DATA_VOLUME}
fi

docker run -d \
    --name ${JENKINS_CONTAINER_NAME} \
    -u jenkins \
    --restart always \
    -p 8080:8080 \
    -p 50000:50000 \
    -v ${JENKINS_DATA_VOLUME}:/var/jenkins_home \
    --env JAVA_OPTS="\
        -Dhudson.footerURL=http://${JENKINS_SERVER_HOST} \
        -Duser.timezone=Asia/Jerusalem \
        -Dhudson.tasks.MailSender.SEND_TO_UNKNOWN_USERS=true \
        -Dhudson.tasks.MailSender.SEND_TO_USERS_WITHOUT_READ=true\
    " \
    jenkins/jenkins:lts
