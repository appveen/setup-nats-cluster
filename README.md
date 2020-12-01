# NATS Streaming cluster setup

This is a tailored version of NATS Streaming cluster setup for data.stack.

The original document can be found under the NATS documentation - [Basic NATS and NATS Streaming Setup](https://docs.nats.io/nats-on-kubernetes/minimal-setup#ha-setup-using-statefulsets)

# Install

To install the cluster run `./install.sh`. Once the services are up connect to nats streaming server using the url - `nats://nats.<namespace>:4222`

# Uninstall

To teardown the cluster run `./uninstall.sh` 

# Changes from the original documentation

* Cluster ID is set to `odp-cluster`
* Persistent volume configuration has been removed.