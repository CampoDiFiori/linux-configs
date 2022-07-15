neofetch;

alias config="vim .config/fish/config.fish"

alias wifi="sudo systemctl restart NetworkManager"

function kubash
  echo Entering into (sudo kubectl get pods | grep -m 1 $argv[1] | cut -d ' ' -f 1);
  sudo kubectl exec -it (sudo kubectl get pods | grep -m 1 $argv[1] | cut -d ' ' -f 1) -- /bin/bash
end

function kustart 
  sudo rm -rf /tmp/juju-mk*
  sudo rm -rf /tmp/minikube.*
  sudo minikube start --vm-driver=none --apiserver-ips=127.0.0.1
end

function kustop
  sudo rm -rf /tmp/juju-mk*
  sudo rm -rf /tmp/minikube.*
  sudo minikube stop
end

function kucheck
  watch -n 1 'sudo kubectl get pods'
end

function kurestart 
  echo Restarting (sudo kubectl get pods | grep -m 1 $argv[1] | cut -d ' ' -f 1);
  sudo kubectl delete pod (sudo kubectl get pods | grep -m 1 $argv[1] | cut -d ' ' -f 1)
end


function kulogs
  watch -n 1 sudo kubectl logs (sudo kubectl get pods | grep -m 1 $argv[1] | awk '{print $1}')
end

function kudelete
  sudo kubectl delete pod (sudo kubectl get pods | grep -m 1 $argv[1] | awk '{print $1}')
end

function sound
  rm -r ~/.config/pulse
  pulseaudio -k
end
