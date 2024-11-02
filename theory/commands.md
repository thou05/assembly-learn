## ⚙️ Commands
**Format:** `<mnemonic> <destination>, <source>`

### 🔄 Address Transfer
- **`mov dest, src`**: Copy data from `src` to `dest`.
- **`lea reg, mem`**: Load effective address of memory operand into `reg16`.

### ➕ Arithmetic Commands
- **Add**: `add dest, src` or `inc dest`
- **Subtract**: `sub dest, src` or `dec dest`
- **Compare**: `cmp dest, src`

- **Multiply**: `mul src`
  - `ax = al * src` for 8-bit, result in `ax`.
  - `dx:ax = ax * 16-bit src`, with `dx` (high), `ax` (low).
  
  **Example:**
  ```asm
  MOV AL, 5   ; AL = 5 
  MOV BL, 10  ; BL = 10 
  MUL BL      ; AL * BL -> AX = 50 (0x32)
  ```
  
- **Divide**: `div src`
  - **8-bit**: Quotient in `AL`, remainder in `AH`.
  - **16-bit**: `DX:AX` holds dividend, quotient in `AX`, remainder in `DX`.
  
  **Example:**
  ```asm
  MOV AX, 50  ; AX = 50 
  MOV BL, 10  ; BL = 10 
  DIV BL      ; AX / BL -> AL (Quotient) = 5, AH (Remainder) = 0
  ```

### 🔄 Control Commands
- **`jmp label`**: Unconditional jump.
- **`je/jz label`**: Jump if equal / zero.
- **`jne/jnz`**: Jump if not equal / non-zero.
- **`jg/jnle`**: Jump if greater (not less or equal).
- **`jge/jnl`**: Jump if greater or equal.
- **`jl/jnge`**: Jump if less (not greater or equal).
- **`loop dest`**: Loop with counter in `cx`.


------
## 4. Lệnh
Dạng lệnh: `<mã gợi nhớ> <toán hạng đích>, <toán hạng nguồn>`
#### 4.1 Lệnh chuyển địa chỉ
- `mov đích, nguồn` : copy dữ liệu từ nguồn đến đích
- `lea reg, mem` : (Load Effective Address) chuyển địa chỉ offset của toán hạng bộ nhớ vào thanh ghi reg16
#### 4.2 Lệnh số học
- Cộng: `add đích, nguồn` or `inc đích`
- Trừ: `sub đích, nguồn` or `dec đích` 
	- inc, dec tăng giảm 1 đơn vị

- Compare `cmp đích, nguồn` : so sánh

- Nhân: `mul nguôn`
	- ax = al * 8bit  : lấy `al * nguồn` -> kết quả nằm trong `ax`
	- dx ax = ax  *  16 bit : `ax * nguồn` -> kết quả nằm trong `dx:ax`, dx chứa [phần cao](#giải-thích-bit-thấp-cao:), ax chứa [phần thấp](#giải-thích-bit-thấp-cao:)
		
	- VD:
		```asm
		MOV AL, 5 ; AL = 5 
		MOV BL, 10 ; BL = 10 
		MUL BL ; AL * BL, kết quả nằm trong AX 
		; AX = 50 (0x32)
		```
- Chia: `div nguồn`
	- lấy `ax` (số bị chia) chia cho `nguồn` (số chia)
	- 8-bit:
		- Thương nằm trong `AL`
		- Số dư nằm trong `AH`
	- 16-bit:  `DX:AX` sẽ chứa số bị chia, trong đó `DX` chứa phần cao và `AX` chứa phần thấp
		- Thương nằm trong `AX`
		- Số dư nằm trong `DX`
	- VD
		```asm
		MOV AX, 50 ; AX = 50 
		MOV BL, 10 ; BL = 10 
		DIV BL ; AX / BL 
		; Thương nằm trong AL (AL = 5) 
		; Số dư nằm trong AH (AH = 0)
		```


