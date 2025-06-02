# Bash Config Repo

This repo stores my Bash configuration files for backup and portability.

---

## 🔧 Custom Command: `lsx`

Extended `ls` command that shows:

- Total size of current or given directory
- Size and creation date of each file/folder
- `/` for directories, `*` for executables
- Error if directory doesn't exist


### ▶️ Usage

```bash
lsx         # List visible files
lsx -a      # Include hidden files
lsx dir/    # List files in a directory
```


### 📌 Example

```bash
lsx abcd
```

   **Output -**

```bash
Total: 1388653749 bytes
README.md                   723 bytes  01-06-2025 20:38
c/                   1073969817 bytes  11-05-2025 17:08
tools/                    22974 bytes  11-05-2025 17:33
```

  **If the path is invalid:**

```bash
lsx: 'abcd' - No such directory exists
```

---
