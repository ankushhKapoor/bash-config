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
  Makefile             193 bytes  Created: 01-06-2025 15:37
  alloc                15776 bytes  Created: 01-06-2025 16:00
  .bashrc              451 bytes  Created: 30-05-2025 18:25
  ```
