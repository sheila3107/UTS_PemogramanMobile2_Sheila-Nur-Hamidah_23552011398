**Nama**  : Sheila Nur Hamidah  
**NIM**   : 23552011398  
**Kelas** : TIF RP 23 CNS A  

# 📝 Perbedaan Cubit dan Bloc, Alasan Pemisahan Arsitektur, dan Contoh State pada CartCubit

## 1. Perbedaan Cubit dan Bloc dalam Arsitektur Flutter

### Cubit
- State management yang lebih sederhana.  
- Tidak menggunakan event.  
- Perubahan state dilakukan langsung melalui method di dalam Cubit.  
- Cocok untuk logika sederhana hingga menengah.  
- Alur kerja: **method → emit(state)**  

### Bloc
- Lebih kompleks dan terstruktur.  
- Menggunakan event dan state.  
- Setiap perubahan state dipicu oleh event.  
- Cocok untuk aplikasi besar dan logika yang rumit.  
- Alur kerja: **event → mapEventToState → emit(state)**  

### Tabel Perbandingan

| Cubit                   | Bloc                          |
| ----------------------- | ----------------------------- |
| Simpler                 | More structured & complex     |
| No event                | Uses event + state            |
| Less boilerplate        | More boilerplate              |
| Good for small features | Good for large-scale features |

---

## 2. Mengapa Penting Memisahkan Model Data, Logika Bisnis, dan UI

- Kode lebih rapi dan mudah dipahami.  
- Maintenance lebih mudah saat aplikasi berkembang.  
- UI bersih tanpa logika bisnis.  
- Mempermudah proses testing.  
- Komponen bisa digunakan kembali (reusable).  
- Mengurangi potensi bug.  
- Aplikasi lebih scalable.  
- Developer dapat fokus pada bagiannya masing-masing.  
- Perubahan model tidak mengganggu UI langsung.  
- Mengikuti standar arsitektur modern.  

---

## 3. Contoh State yang Digunakan dalam CartCubit

### 1. CartInitial
- State awal saat keranjang kosong atau belum dimuat.  
- Untuk menampilkan state awal (empty cart / loading).  

### 2. CartLoaded
- State ketika data keranjang berhasil dimuat.  
- Berisi list item, total harga, dan jumlah item.  

### 3. CartUpdated
- State saat ada perubahan pada keranjang:  
  - Menambah item  
  - Menghapus item  
  - Mengubah quantity  
- Memberi tahu UI agar diperbarui.  

### State Tambahan Opsional
- **CartLoading** → digunakan saat proses update atau fetching data.  
- **CartError** → jika terjadi error saat memproses keranjang.  

---

## Link Video YouTube
https://youtu.be/f9GGarzqpLk
