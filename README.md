# 🌟 Learn Assembly

## Table of Contents
1. [🗂 Data Declaration](./theory/data-declaration.md)
2. [🏗 Program Structure](./theory/program-structure.md)
3. [🔧 Common 21h Interrupts](./theory/common-21h-interrupts.md)
4. [⚙️ Commands](./theory/commands.md)
   - [🔄 Address Transfer](./theory/commands.md#-address-transfer)
   - [➕ Arithmetic Commands](./theory/commands.md#arithmetic-commands)
   - [🔄 Control Commands](./theory/commands.md#control-commands)
5. [📘 Additional Knowledge](./theory/additional-knowledge.md)
   - [ds:dx](./theory/additional-knowledge.md#dsdx)
   - [Byte Order: High and Low Parts](./theory/additional-knowledge.md#byte-order-high-and-low-parts)
   - [Register Structure](./theory/additional-knowledge.md#register-structure)

6. [The Teacher Guides Code](#the-teacher-guides-code)
7. [More Code for Self-Study](#more-code-for-self-study)


## Basic knowledge
### 1. Khai báo dữ liệu
- Khai báo biến
	- `s1 db 1` : s1 dài 1 byte, s1 = 1
	- `s2 db ?`: s2 dài 1 byte và không có giá trị đầu
	- `s3 db 10 dup(?)`: mảng 10 phần tử, không gán giá trị ban đầu
	- `s4 db 'a'` : biến kiểu ký tự
	- `s5 db 'thao xinh gai$'` : biến kiểu chuỗi, `$` - kết thúc chuỗi

### 2. Cấu trúc chương trình
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

### 3. Ngắt 21 thường dùng
- `01h`: nhập 1 ký tự, `al` chứa ký tự nhập
- `02h`: hiển thị 1 ký tự ascii trong thanh `dl`
- `09h`: in ra 1 chuỗi ký tự kết thúc bằng `$`, địa chỉ chuỗi lưu trong `ds:dx`
- `4ch`: thoát chương trình, `al` : mã thoát
- `0Ah` = `10` : nhập chuỗi ký tự từ bàn phím đến khi enter, địa chỉ lưu trong [`ds:dx`](#`ds:dx`)
 
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
	- dx ax = ax  *  16 bit : `ax * nguồn` -> kết quả nằm trong `dx:ax`, dx chứa [phần cao](./theory/additional-knowledge.md#giải-thích-bit-thấp-cao:), ax chứa [phần thấp](./theory/additional-knowledge.md#giải-thích-bit-thấp-cao:)
		
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


#### 4.3 Lệnh chuyển điều khiển
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




## The Teacher Guides Class Exercises
1. Lesson 1
   - [In ky tu](./src/1.in-ky-tu.asm)
2. Lesson 2
   - [Cong hai so](./src/2.cong-hai-so.asm)
   - [Cong tru 1 ky tu](./src/2.congtru-1kytu.asm)
   - [In chuoi](./src/2.in-chuoi.asm)
   - [In xau ky tu](./src/2.in-xau-ki-tu.asm)
3. Lesson 3
   - [In tu A den Z](./src/3.inAtoZ.asm)
   - [Lenh dieu khien](./src/3.lenhdieukhien.asm)
4. Lesson 4
   - [Nhap va in ra so 2 so](./src/4.nhap-in-2-so.asm)
   - [Tinh tong tu 1 den n](./src/4.sum-n-so.asm)

## More Exercises for Self-Study
- [Chuyen giua hoa va thuong](./src/chuyen-giua-hoa-thuong.asm)
- [Nhap va in ra so 16bit](./src/nhap-in-so-16-bit.asm)











