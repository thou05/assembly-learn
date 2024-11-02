
#Eng ver

# 🌟 Learn Assembly

## 🗂 Data Declaration
- **Declare variables:**
  - `s1 db 1` - `s1` is 1 byte, with value 1.
  - `s2 db ?` - `s2` is 1 byte, uninitialized.
  - `s3 db 10 dup(?)` - Array of 10 elements, uninitialized.
  - `s4 db 'a'` - Character type.
  - `s5 db 'thao xinh gai$'` - String type, ends with `$`.

## 🏗 Program Structure
```assembly
.model small
.stack 100h
.data

.code
	main proc
		; Load data segment
		mov ax, @data
		mov ds, ax

		; End program
		mov ah, 4ch
		int 21h
	main endp
end main
```
## 🔧 Common 21h Interrupts
- **01h**: Input a character, `AL` contains it.
- **02h**: Display ASCII character in `DL`.
- **09h**: Display string ending with `$`, address in `DS:DX`.
- **4Ch**: Program exit, `AL`: exit code.
- **0Ah** = **10**: Input string from keyboard till Enter, address in `DS:DX`.

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

### 📘 Additional Knowledge

#### `ds:dx`
- **`ds:dx`** represents a memory address:
  - **`ds`**: segment, **`dx`**: offset.
  - Full address = `ds * 16 + dx`.

#### Byte Order: High and Low Parts
- Low/High parts refer to significant bits:
  - **Little-endian**: Low byte stored first, then high.
  - **Big-endian**: High byte stored first.

  **Example with `0xABCD`:**
  - `al` = `0xCD` (low), `ah` = `0xAB` (high).

#### Register Structure
Registers like `ax`, `bx`, `cx`, and `dx` can be split:
- **Low part**: `al`, `bl`, `cl`, `dl` (8-bit).
- **High part**: `ah`, `bh`, `ch`, `dh` (8-bit).

**Example:**
```asm
sub al, 48             
mov cl, al
mov ax, a             
mul bx                  
add ax, cx             
mov a, ax   

; `cl` is the low part of `cx`, takes value from `al`.
```


#Vie ver
## 🗂 Khai báo dữ liệu
- Khai báo biến
	- `s1 db 1` : s1 dài 1 byte, s1 = 1
	- `s2 db ?`: s2 dài 1 byte và không có giá trị đầu
	- `s3 db 10 dup(?)`: mảng 10 phần tử, không gán giá trị ban đầu
	- `s4 db 'a'` : biến kiểu ký tự
	- `s5 db 'thao xinh gai$'` : biến kiểu chuỗi, `$` - kết thúc chuỗi

## 🏗 Cấu trúc chương trình
```assembly
.model small
.stack 100h
.data

.code
	main proc
		;chuyen dia chi data vao ds
		mov ax, @data
		mov ds, ax

		;ket thuc chuong trinh
		mov ah, 4ch
		int 21h
		main endp
		
	end main
```

## 🔧 Ngắt 21 thường dùng
- `01h`: nhập 1 ký tự, `al` chứa ký tự nhập
- `02h`: hiển thị 1 ký tự ascii trong thanh `dl`
- `09h`: in ra 1 chuỗi ký tự kết thúc bằng `$`, địa chỉ chuỗi lưu trong `ds:dx`
- `4ch`: thoát chương trình, `al` : mã thoát
- `0Ah` = `10` : nhập chuỗi ký tự từ bàn phím đến khi enter, địa chỉ lưu trong [`ds:dx`](#`ds:dx`)
 




## ⚙️ Lệnh
Dạng lệnh: `<mã gợi nhớ> <toán hạng đích>, <toán hạng nguồn>`
#### 🔄  lệnh chuyển địa chỉ
- `mov đích, nguồn` : copy dữ liệu từ nguồn đến đích
- `lea reg, mem` : (Load Effective Address) chuyển địa chỉ offset của toán hạng bộ nhớ vào thanh ghi reg16
#### ➕ lệnh số học
- Cộng: `add đích, nguồn` or `inc đích`
- Trừ: `sub đích, nguồn` or `dec đích` 
	- inc, dec tăng giảm 1 đơn vị

- Compare `cmp đích, nguồn` : so sánh

- Nhân: `mul nguôn`
	- ax = al * 8bit  : lấy `al * nguồn` -> kết quả nằm trong `ax`
	- dx ax = ax  *  16 bit : `ax * nguồn` -> kết quả nằm trong `dx:ax`, dx chứa [phần cao](#Giải-thích-bit-thấp-cao:), ax chứa [phần thấp](#Giải-thích-bit-thấp-cao:)
		
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


#### 🔄 lệnh chuyển điều khiển
- `jmp label` : chuyển chương trình từ vị trí này sang vị trí khác, không cần điều kiện
- `je/jz label` : jump equal/ jump zero nhảy nếu bằng
- `jne/ jnz` : không bằng

- `jg/jnle` :greater/not less equal lớn hơn
- `jge/gnl` : greater equal / not less : lớn hoăn hoặc bằng
- `ja` :  nhảy nếu lớn hơn

- `jl/jnge` : less / not greater equal
- `jle/ jng` : less equal / not greater : nhỏ hơn or bằng
- `jb label`: nhảy nếu nhỏ hơn

- `cmp đích, nguồn`: so sánh

- `loop đích` : vòng lặp

## 📘 Some additional knowledge to help u understand more deeply
#### `ds:dx`
- **`ds:dx`** là một cách biểu diễn địa chỉ bộ nhớ
		- **`ds`** chứa phân đoạn (segment) của dữ liệu - thanh ghi đoạn dữ liệu
		- **`dx`** chứa đệm (offset) bên trong phân đoạn đó, giúp chỉ định vị trí chính xác trong bộ nhớ.
		- ` Địa chỉ bộ nhớ=(ds×16)+dx`

#### Giải thích bit thấp cao:
- Phần thấp - cao là cách máy tính lưu trữ và xử lý dữ liệu theo dạng nhị phân,  phân chia các bit theo độ quan trọng: phần thấp chứa các bit ít quan trọng hơn, phần cao chứa các bit quan trọng hơn.
- Khi lưu trữ, các byte có thể được sắp xếp theo hai cách:
	- **Little-endian**: Byte có trọng số thấp được lưu ở địa chỉ bộ nhớ thấp, byte có trọng số cao được lưu ở địa chỉ bộ nhớ cao hơn. Đây là cách phổ biến trên các hệ thống x86.
	- **Big-endian**: Byte có trọng số cao được lưu ở địa chỉ thấp, byte có trọng số thấp được lưu ở địa chỉ cao hơn.

=> Tóm lại, trong little-endian
	- Phần cao: các bit ở vị trí cao (quan trọng hơn)
	- Phần thấp: các bit ở vị trí thấp (ít quan trọng hơn).
- VD:
	- Giả sử bạn có một giá trị 16 bit như `0xABCD` trong thanh ghi `ax`:
		- **`al`** sẽ chứa **`0xCD`** (phần thấp).
		- **`ah`** sẽ chứa **`0xAB`** (phần cao).
	- Nếu bạn thực hiện lệnh `mov ax, 0x1234`, thì sau khi thực hiện lệnh này:
		- `ax` sẽ là 0x1234,
		- `al` sẽ là 0x34 (phần thấp),
		- `ah` sẽ là 0x12 (phần cao).

#### Cấu trúc thanh ghi
Trong bộ vi xử lý x86, thanh ghi `cx`, `ax`, `bx`, `cx`, và `dx` là một thanh ghi 16 bit, được chia thành hai phần:
- **Phần thấp**: `al`, `bl`, `cl`, và `dl` (8 bit)
- **Phần cao**: `ah`, `bh`, `ch`, `dh` (8 bit)
	=> khi thao tác với `ax` ... , bạn có thể thao tác với cả hai phần (16 bit) hoặc chỉ một phần (8 bit) của nó.

VD:
```asm
sub al, 48             
mov cl, al
mov ax, a             
mul bx                  
add ax, cx             
mov a, ax   

;cl là phần thấp của cx => cx lấy giá trị thanh ghi al
```


