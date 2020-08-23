#Config de mise en veille
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -CHANGE -monitor-timeout-ac 0
powercfg -CHANGE -monitor-timeout-dc 0
powercfg -CHANGE -disk-timeout-ac 0
powercfg -CHANGE -disk-timeout-dc 0
powercfg -CHANGE -standby-timeout-ac 0
powercfg -CHANGE -standby-timeout-dc 0
powercfg -CHANGE -hibernate-timeout-ac 0
powercfg -CHANGE -hibernate-timeout-dc 0