FROM node:8-alpine as base 

COPY . /app
WORKDIR  /app
RUN npm install
RUN npm install applicationinsights --save

FROM base as test 
RUN npm test
# this creates /app/reportsuserprofile-report.xml 
# RUN ls -l reports && pwd
CMD cat /app/reports/userprofile-report.xml

FROM base as final
EXPOSE 8080
CMD npm start