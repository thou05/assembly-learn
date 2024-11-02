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


------
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

