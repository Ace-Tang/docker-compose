# -----------------
# Host info
# -----------------
export HOST_ID="master-001"
# HOST_IP is the VM's public IP, for remote communication
export HOST_IP="45.249.244.112"
# LOCAL_NIC_IP is the IP configured on VM's local NIC
export LOCAL_NIC_IP=$(ip addr show eth0 | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')

# -----------------
# Zookeeper
# -----------------
CONF_ROOT=$(pwd)
export ZK_URI="zk://$LOCAL_NIC_IP:2181"
# !!! Remember to edit "zoo.cfg" & "myid" in ZK_CONF_DIR
export ZK_CONF_DIR="$CONF_ROOT/zookeeper"

# -----------------
# Mesos common config
# -----------------
export MESOS_LISTEN_ON_IP=$LOCAL_NIC_IP

# -----------------
# Mesos Master only
# -----------------
export CLUSTER_NAME="cluster"
export MESOS_MASTER_PORT="25050"
export MESOS_QUORUM=1
export MESOS_MASTER_WORK_DIR='/data'

# -----------------
# Mesos Slave only
# -----------------
export MESOS_SLAVE_PORT="25051"
export MESOS_SLAVE_ATTR="id:${HOST_ID}"
export MESOS_SLAVE_WORK_DIR='/tmp/mesos_slave'
export MESOS_RECOVERY_TIMEOUT="15mins"
export MESOS_EXECUTOR_REGISTRATION_TIMEOUT="$MESOS_RECOVERY_TIMEOUT"

# -----------------
# Marathon
# -----------------
export MARATHON_HTTP_PORT="28081"
export M_LIBPROCESS_IP=$LOCAL_NIC_IP


