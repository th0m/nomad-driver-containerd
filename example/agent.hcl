log_level = "INFO"

plugin "containerd-driver" {
  config {
    enabled = true
    stats_interval = "5s"
  }
}

server {
  default_scheduler_config {
    scheduler_algorithm = "spread"
    memory_oversubscription_enabled = true

    preemption_config {
      batch_scheduler_enabled   = true
      system_scheduler_enabled  = true
      service_scheduler_enabled = true
    }
  }
}

client {
  host_volume "s1" {
    path = "/tmp/host_volume/s1"
    read_only = false
  }
}
