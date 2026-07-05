# Day 13 – Linux Volume Management (LVM)

## Task
Learn LVM to manage storage flexibly – create, extend, and mount volumes.

## Task 1: Check Current Storage
Run: `lsblk`, `pvs`, `vgs`, `lvs`, `df -h`

<img width="673" height="254" alt="image" src="https://github.com/user-attachments/assets/7192f13e-cb26-4352-ad9e-696bcf1c3979" />

<img width="1368" height="456" alt="image" src="https://github.com/user-attachments/assets/e874eac2-abf1-48a6-8be3-7b7133715cfe" />

## Task 2: Create Physical Volume

<img width="763" height="155" alt="image" src="https://github.com/user-attachments/assets/38403d92-db70-4bf7-9438-30c1582a7e4c" />


## Task 3: Create Volume Group

<img width="763" height="151" alt="image" src="https://github.com/user-attachments/assets/03ba47d2-79f8-4d75-a8be-63bd3d3ab1d8" />

## Task 4: Create Logical Volume

<img width="763" height="199" alt="image" src="https://github.com/user-attachments/assets/5c49970c-36b9-44fb-a001-bb46a7c9b1bf" />

## Task 5: Format and Mount

<img width="763" height="616" alt="image" src="https://github.com/user-attachments/assets/6499fee6-7b26-4962-a173-291f70014fb5" />

## Task 6: Extend the Volume

<img width="763" height="106" alt="image" src="https://github.com/user-attachments/assets/f40ad4c8-28a4-4f52-b348-68720312d8a0" />

## Task 7: Mounting PV directly

<img width="763" height="89" alt="image" src="https://github.com/user-attachments/assets/4b065040-42bc-4215-9886-bf6c758404b1" />

<img width="763" height="747" alt="image" src="https://github.com/user-attachments/assets/e50c70a5-9ee6-48bb-be19-5aa9f8a4bb02" />


## Commands Used

* `lsblk` - List block devices and their mount
* `df -h` - Show mounted filesystem usage
* `pvcreate /dev/loop26` - Initialize partition as PV
* `pvs` - List all PVs
* `vgcreate tws_vg /dev/loop26` - Create a VG from PVs
* `vgs` - List all VGs
* `lvcreate -L 10m -n tws_lv tws_vg` - Create LV of 10mb
* `lvextend -L +10m /dev/tws_vg/tws_lv` - Extend LV by 10mb
* `lvs` - List all LVs
* `mkfs.ext4 /dev/tws_vg/tws_lv` - Create ext4 filesystem
* `mount /dev/tws_vg/tws_lv /mnt/tws_lv_mount` - Mount created LV
* `resize2fs /dev/vg_name/lv_name` - Resize ext2/3/4 filesystem
* `mkfs -t ext4 /dev/tws_vg/tws_lv && mount /dev/tws_vg/tws_lv /mnt/tws_lv_mount` - Directly mount PV

## What I learned

- LVM storage stack: LVM organizes storage in three layers — Physical Volumes (PVs) at the base, Volume Groups (VGs) in the middle, and Logical Volumes (LVs) on top, which is what you actually format and use.

- Why LVM over plain partitions: Traditional partitions are rigid once created, but LVM lets you grow or shrink volumes on the fly, without unmounting or rebooting the system.

- Setting up Physical Volumes: Any raw disk or partition can be converted into a Physical Volume using the pvcreate command, making it usable within the LVM ecosystem.

- Combining PVs into a Volume Group: Several Physical Volumes can be pooled together into one Volume Group, giving you a single, flexible storage pool to allocate from instead of managing disks individually.

- Resizing the filesystem after extending an LV: Growing a Logical Volume alone isn't enough — the underlying filesystem also needs to be expanded with resize2fs before the extra space is actually usable.

- Formatting and mounting: Logical Volumes need to be formatted with a filesystem (like mkfs.ext4) and then mounted to a directory before they can store any real data.

- Avoid mounting PVs directly: While technically you can mount a Physical Volume directly, it defeats the purpose of using LVM — the real value comes from the abstraction and flexibility that VGs and LVs provide on top.
