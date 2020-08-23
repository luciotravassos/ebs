/* Formatted on 2005/09/06 13:43 (Formatter Plus v4.7.0) */
SELECT   target_node,diagnostic_level,
         user_concurrent_queue_name, enabled_flag, concurrent_queue_name,
         description, data_group_id, resource_consumer_group, cache_size,
         node_name, os_queue, node_name2, os_queue2
    FROM fnd_concurrent_queues_vl
   # WHERE TARGET_NODE = 'ALBAPP0110'
    --WHERE CONCURRENT_QUEUE_NAME = 'VISAOPMGR'
ORDER BY DECODE (manager_type, '1', 1, '3', 2, '2', 3, '0', 4),
         concurrent_queue_name
