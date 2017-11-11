FROM couchbase/server:enterprise-5.0.0

COPY configure-node.sh /opt/couchbase

CMD ["/opt/couchbase/configure-node.sh"]

