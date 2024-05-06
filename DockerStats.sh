#!/bin/bash
while true; do
    echo -e "\033[92m__________________________________________DOCMONITOR________________________+"
    echo "1. Docker Status"
    echo "2. Docker Storage"
    echo "3. Docker Images"
    echo "4. Docker Running Container"
    echo "5. Docker All Container"
    echo "6. Docker Version"
    echo "Enter 'exit' or press CTRL + C to quit"

    read -p "Enter the service: " val

    if [ "$val" == "exit" ]; then
        break
    fi

    echo -e "\033[94m<<<<------------------------->>>>\033[0m"

    if [ "$val" == "1" ]; then
        output=$(sudo systemctl status docker.service)
    elif [ "$val" == "2" ]; then
        output=$(sudo docker system df)
    elif [ "$val" == "3" ]; then
        output=$(sudo docker image ls)
    elif [ "$val" == "4" ]; then
        output=$(sudo docker container ls)
    elif [ "$val" == "5" ]; then
        output=$(sudo docker container ls -a)
    elif [ "$val" == "6" ]; then
        output=$(sudo docker container ls -a | grep Exited)
    else
        output="Invalid input"
    fi

    echo "$output"
    echo -e "\033[94m<<<<-___-----___------__________------____------___->>>>\033[0m"
done