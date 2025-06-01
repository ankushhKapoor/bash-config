# Bash Config Repo

This repository contains my personal Bash configuration files for easy backup and portability.

---

## Custom Command: `lsx`

`lsx` is an extended version of the `ls` command that shows total size of current dir, each file or directory on a separate line along with its size and creation date/time.

* **Usage:**

  ```bash
  lsx          # List visible files with size and creation date/time
  lsx -a       # List all files including hidden ones with size and creation date/time
  ```

* **Example output:**

  ```
  Total: 1388653749 bytes
  README.md                     723 bytes  01-06-2025 20:38
  TEST                          572 bytes  11-05-2025 12:04
  c                      1073969817 bytes  11-05-2025 17:08
  python                  314659663 bytes  10-05-2025 00:27
  tools                       22974 bytes  11-05-2025 17:33
  ```
