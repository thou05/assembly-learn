## 🔧 Common 21h Interrupts
- **01h**: Input a character, `AL` contains it.
- **02h**: Display ASCII character in `DL`.
- **09h**: Display string ending with `$`, address in `DS:DX`.
- **4Ch**: Program exit, `AL`: exit code.
- **0Ah** = **10**: Input string from keyboard till Enter, address in `DS:DX`.
