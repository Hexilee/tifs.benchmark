## Benchmarks of TiFS

Some benchmark sripts and configs of TiFS. There is the [result](https://docs.google.com/spreadsheets/d/1QusW0FYAjLRzDN9LbMUTLvwuxtZvNz_g_1GIrwXnevc/edit?usp=sharing) tested by my personal PC with following requirements.

CPU | Intel(R) Core(TM) i5-10210U CPU @ 1.60GHz 
Memory | 2 x 16GB DDR4 2666MHz 
Disk | PM981 512GB M.2 NVME

## Start

### Deploy tikv cluster

First at all, you need a tikv cluster to storage data of tifs. It's recommended to install [TiUP](https://github.com/pingcap/tiup) and use our deploy.sh:
```bash
./deploy.sh <config file> <replicas>
```
You can pick a config file between tikv-template.yaml and titan.yaml. For example, if you want to deploy a tikv cluster with 3 replicas and titan enabled, you should execute `./deploy.sh titan.yaml 3`.

### Mount

When you have a tikv cluster, you can mount it by TiFS. It's recommended to install TiFS by [docker](https://www.docker.com). You can use our mount.sh with docker installed:

```bash
./mount.sh <mount point> <block size>
```

The mount point is a directory in your local filesystem, and you can pick a block size in 4k, 64k and 1m.

#### Remount

Just `umount <mount point>` and mount again.

> **NOTICE**
> You should restart tikv cluster before you remount with different block size, and all the data will be cleaned after restart.

### Bench

We test the read/write speed by [dd](https://www.wikiwand.com/en/Dd_(Unix)) and test the random read/write speed by [fio](https://github.com/axboe/fio). You can use our dd.sh and fio.sh with dd and fio installed:

```bash
dd <dir> <blksize>
fio <dir> <blksize>
```

The `dir` can be any sub directory of mount point and the `blksize` is the workload block size. You can pick block size in in 4k, 64k, 1M, 4M for dd and pick it in 4k, 64k, 1m for fio. 



