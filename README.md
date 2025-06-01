# Bash Config Repo

This repository contains my personal Bash configuration files for easy backup and portability.

---

## Custom Command: `lsx`

`lsx` is an extended version of the `ls` command that shows each file or directory on a separate line along with its size and creation date/time.

* **Usage:**

  ```bash
  lsx          # List visible files with size and creation date/time
  lsx -a       # List all files including hidden ones with size and creation date/time
  ```

* **Example output:**

  ```
  c                            4096 bytes  Created: 11-05-2025 17:08
  python                       4096 bytes  Created: 10-05-2025 00:27
  tools                        4096 bytes  Created: 11-05-2025 17:33
  ```
