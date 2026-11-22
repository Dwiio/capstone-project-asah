# Official Requirements Audit — A26-CS202

**Sumber yang diperiksa:** Project Plan Asah 2026 (12 halaman), Project Brief (18 halaman), Dokumen Panduan Wawancara UMKM (26 halaman), dan Master Execution Prompt yang diunggah pengguna. Tanggal audit: 22 November 2026.

> Batas audit penting: Project Brief bagian 4 secara eksplisit merujuk dokumen terpisah **Checklist Tech Stack** untuk seluruh Main Quest tiga learning path. Dokumen checklist tersebut tidak termasuk unggahan. Dokumen Use Case Google Docs dan dokumen aset UMKM Google Docs yang ditautkan pada prompt juga tidak dapat dianggap telah dibaca hanya dari URL yang tertulis. Karena itu, nama dan rincian quest teknis resmi per learning path tidak direka. Unggah Checklist Tech Stack dan ekspor dokumen Google Docs Use Case/aset sebagai DOCX/PDF agar audit quest resmi bisa dituntaskan.

## Persyaratan yang dapat diverifikasi dari Project Plan

| ID | Learning Path | Quest | Persyaratan resmi/komitmen Project Plan | Implementasi | File/Modul | Acceptance criteria | Bukti |
|---|---|---|---|---|---|---|---|
| PLAN-FS-01 | Full Stack | Wajib tim | Admin dapat mengakses sistem | Login admin, session, logout, rate limit dasar, CSRF token | `src/server.js`, `public/app.js` | Kredensial valid membuat sesi; salah ditolak; endpoint admin tanpa sesi 401 | `npm test`, `docs/TESTING_REPORT.md` |
| PLAN-FS-02 | Full Stack | Wajib tim | Tambah, lihat, ubah, hapus membership; data tersimpan konsisten | CRUD anggota, soft archive, validasi, ID unik | `/api/members`, modal membership | Buat/edit/detail/archive berjalan; data tetap tersimpan setelah restart | `storage/db.json` runtime; testing report |
| PLAN-DS-01 | Data Science | Wajib tim | Pencarian nama atau ID dan data simulasi/dummy terstruktur | Search nama/ID/telepon, filter status/paket, pagination; CSV sintetis | API `/api/members`, `datasets/`, `notebooks/` | Query menghasilkan subset tepat; CSV diberi label sintetis | automated tests + notebook |
| PLAN-AE-01 | AI Engineering | Wajib tim | Antarmuka mudah dipahami dan panduan penggunaan/dokumentasi | Public site, admin dashboard, responsive CSS, user guide | `public/`, `docs/USER_GUIDE.md` | Alur admin dijelaskan; layout adaptif | source + manual check |
| PLAN-DS-SQ-01 | Data Science | Side Quest dipilih | Dashboard analitik: jumlah anggota, distribusi paket, status, tren pendaftaran | Analytics API dan grafik berbasis data aplikasi | `/api/analytics`, `public/app.js` | Nilai total/status/distribusi/tren berasal dari data tersimpan | `docs/TESTING_REPORT.md` |
| PLAN-AE-SQ-01 | AI Engineering | Side Quest dipilih | Chatbot menjawab info membership/biaya/jam/prosedur dan fallback | Chat FAQ berbasis aturan dan knowledge base terverifikasi | `/api/chat`, FAQ di `src/server.js` | Pertanyaan dikenal mendapat jawaban grounded; tak dikenal mendapat fallback | chatbot manual/API test |

## Checklist Main Quest program — belum dapat diekstrak

| ID | Learning Path | Quest | Persyaratan resmi | Status audit | Tindakan |
|---|---|---|---|---|---|
| OFF-FS-MQ | Full Stack Development | Main Quest | Rincian item ada pada Checklist Tech Stack yang dirujuk Project Brief bagian 4, tetapi file tidak diunggah | BLOCKED | Unggah Checklist Tech Stack resmi |
| OFF-DS-MQ | Data Science | Main Quest | Rincian item ada pada Checklist Tech Stack yang dirujuk Project Brief bagian 4, tetapi file tidak diunggah | BLOCKED | Unggah Checklist Tech Stack resmi |
| OFF-AE-MQ | AI Engineering | Main Quest | Rincian item ada pada Checklist Tech Stack yang dirujuk Project Brief bagian 4, tetapi file tidak diunggah | BLOCKED | Unggah Checklist Tech Stack resmi |

## Batasan dan keputusan sumber

- Project Plan halaman 3–4: membership management dan data search/dummy serta UI/documentation merupakan pekerjaan wajib tim; Dashboard Analitik Membership dan Chatbot Gym adalah Side Quest tambahan.
- Project Plan halaman 4: payment gateway, WhatsApp automation, fingerprint/IoT, akuntansi penuh, multi-cabang, kasir/inventaris/payroll, dan platform komersial penuh dikecualikan.
- Project Brief halaman 2–3: hasil harus dilaporkan sebagai kondisi aktual; pengujian internal memakai data simulasi; jangan klaim efisiensi operasional tanpa pengukuran UMKM.
- Project Brief halaman 4–5: seluruh Main Quest dari ketiga learning path harus masuk checklist teknis, sementara Side Quest yang dikerjakan dicantumkan.
- Dokumen wawancara menjelaskan identitas UMKM/PIC dan proses wawancara, tetapi tidak menyediakan harga, jam operasional, nomor kontak, alamat terperinci, atau foto fasilitas terverifikasi dalam aset yang dapat diekstrak.
- Logo asli pengguna digunakan tanpa modifikasi. Tidak ada foto fasilitas gym yang terverifikasi pada dokumen yang dapat diekstrak; placeholder digunakan agar tidak menyajikan foto pihak lain sebagai aset UMKM.
