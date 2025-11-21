Siap, aku buatin ulang versi README tanpa tulisan “10 poin” di dalamnya. Tinggal copas 👇

---

# 📝 Perbedaan Cubit dan Bloc, Alasan Pemisahan Arsitektur, dan Contoh State pada CartCubit

## **1. Perbedaan Cubit dan Bloc dalam Arsitektur Flutter**

### **Cubit**

* State management yang lebih sederhana.
* Tidak menggunakan event.
* Perubahan state dilakukan langsung melalui method di dalam Cubit.
* Cocok untuk logika sederhana hingga menengah.
* Alur kerja: **method → emit(state)**

### **Bloc**

* Lebih kompleks dan terstruktur.
* Menggunakan event dan state.
* Setiap perubahan state dipicu oleh event.
* Cocok untuk aplikasi besar dan logika yang rumit.
* Alur kerja: **event → mapEventToState → emit(state)**

### **Kesimpulan Perbandingan**

| Cubit                   | Bloc                          |
| ----------------------- | ----------------------------- |
| Simpler                 | More structured & complex     |
| No event                | Uses event + state            |
| Less boilerplate        | More boilerplate              |
| Good for small features | Good for large-scale features |

---

## **2. Mengapa penting memisahkan Model Data, Logika Bisnis, dan UI dalam Flutter**

* Struktur kode lebih rapi dan mudah dipahami.
* Mudah melakukan maintenance ketika aplikasi berkembang.
* UI tetap bersih tanpa bercampur logika bisnis.
* Mempermudah proses testing terhadap data dan logika.
* Komponen dapat digunakan kembali (reusable).
* Mengurangi potensi bug.
* Aplikasi lebih mudah dikembangkan secara bertahap.
* Developer bisa fokus pada peran masing-masing (UI vs logic).
* Perubahan model tidak mempengaruhi UI secara langsung.
* Mengikuti pola arsitektur modern yang standar.

---

## **3. Contoh State yang Digunakan dalam `CartCubit` dan Fungsinya**

### **1. CartInitial**

* State awal saat keranjang masih kosong atau belum dimuat.
* Biasanya digunakan untuk menampilkan tampilan empty cart atau loading awal.

### **2. CartLoaded**

* State ketika data keranjang berhasil dimuat.
* Berisi data seperti list item, total harga, dan jumlah item.

### **3. CartUpdated**

* State yang muncul ketika ada perubahan pada keranjang:

  * Menambah item
  * Menghapus item
  * Mengubah quantity
* Memberi tahu UI bahwa keranjang perlu diperbarui.

### **State Opsional Tambahan**

* **CartLoading** → digunakan saat memproses perubahan atau mengambil data.
* **CartError** → digunakan ketika terjadi error, misalnya gagal menambah item atau gagal memuat data.
