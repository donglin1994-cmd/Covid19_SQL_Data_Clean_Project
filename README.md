# Covid19_Sql_Data_Clean_Project
##Table of Content

#Introduction

#Technologies

#Setup

## Introduction
Use SQL commands to get Covid-19 summary statistics

## Technologies
Tool: Azure Data Studio

DBMS: Mssql 

## Setup
Install docker 
Pull image
Launch MSSQL server 

On terminal: sudo docker pull mcr.microsoft.com/mssql/server:2019-latest

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=xxxxxxx" -p 1433:1433 mcr.microsoft.com/mssql/server:2019-latest

## Sources
This project is inspired by Youtuber Alex

Link dataset: https://ourworldindata.org/covid-deaths

link to Youtube channel: https://youtu.be/qfyynHBFOsM

Link to github: https://bit.ly/3xNwzGK

