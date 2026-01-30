# 🚀 logFC12 Personal Repository

Welcome to my personal Termux repository! This repo contains custom tools and scripts designed specifically for Termux users.

## 🛠️ Available Tools
| Package Name | Description |
|--------------|-------------|
| **afb** | A simple ADB and Fastboot wrapper for Termux. |
| **nitepad** | A custom alias for the Nano text editor. |

---

## 📥 Quick Installation (One-Line Installer)
Open your Termux and copy-paste the command below:

```bash
curl -sL https://logfc12.github.io/my-repo/install.sh | bash
```

---

## 💡 Manual Installation
If you prefer to do it manually, follow these steps:

1. **Add Repository:**
   ```bash
   echo "deb [trusted=yes] https://logfc12.github.io/my-repo/ ./" > $PREFIX/etc/apt/sources.list.d/myrepo.list
   ```

2. **Update & Install:**
   ```bash
   apt update
   pkg install nitepad # or pkg install afb
   ```

---

## ⭐ Support
If you find these tools helpful, please give this repository a **Star** ⭐ to show your support!

**Maintainer:** [logFC12](https://github.com/logfc12)
