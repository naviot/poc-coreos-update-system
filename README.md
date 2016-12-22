# poc-coreos-update-system

### SSH
```sh
sudo cp code_dir/service_unit/* /etc/systemd/system/
sudo systemctl daemon-reload

sudo systemctl start client.service
sudo systemctl start updater.service

#check output
journalctl -f -u client.service
#chek output
journalctl -f -u updater.service

#run update
docker exec -it updater /code_dir/update_code.sh --client update

#check output
journalctl -f -u client.service
#chek output
journalctl -f -u updater.service
```

### systemctl
```sh
sudo cp code_dir/systemd/service_unit/* /etc/systemd/system/
sudo systemctl daemon-reload

sudo systemctl start client.service
sudo systemctl start updater.service

#check output
journalctl -f -u client.service
#chek output
journalctl -f -u updater.service

#run update
docker exec -it updater /code_dir/systemd/update_code.sh --client update

#check output
journalctl -f -u client.service
#chek output
journalctl -f -u updater.service
```

