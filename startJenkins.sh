docker run -d \
    --name jenkins-home \
    -u jenkins \
    --restart always \
    -p 8080:8080 \
    -p 50000:50000 \
    -v /opt/jenkins:/var/jenkins_home \
    --env JAVA_OPTS="\
        -Dhudson.footerURL=http://18.236.149.142 \
        -Duser.timezone=Asia/Jerusalem \
        -Dhudson.tasks.MailSender.SEND_TO_UNKNOWN_USERS=true \
        -Dhudson.tasks.MailSender.SEND_TO_USERS_WITHOUT_READ=true\
    " \
    jenkins/jenkins:lts
