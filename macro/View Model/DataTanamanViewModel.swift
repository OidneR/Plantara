//
//  DataTanamanViewModel.swift
//  macro
//
//  Created by Michael Tanakoman on 15/11/21.
//

import Foundation

enum PlantType: String, CaseIterable{
    case bayam = "Bayam"
    case tomatCeri = "Tomat Ceri"
    case cabai = "Cabai"
    case pakcoy = "Pakcoy"
    case sawi = "Sawi"
    case kangkung = "Kangkung"
    case selada = "Selada"
    case kemangi = "Kemangi"
    
    func getsDataTanaman(with name: String) -> TanamanBaru{
        for plant in PlantType.allCases{
            if(name.caseInsensitiveCompare(plant.rawValue) == .orderedSame){
                return plant.dataTanaman
            }
        }
        return PlantType.bayam.dataTanaman
    }
    
    var dataTanaman: TanamanBaru {
        switch self{
                case .bayam:
                    return TanamanBaru(
                        namaTanaman: "Bayam",
                        imageTanaman: "iconBayam",
                        difficultyTanaman: "Easy",
                        harvestTime: "20-21 hari",
                        minSuhu: 16, maxSuhu: 20,
                        minSun: 10, maxSun: 20,
                        minKelembabanTanah: 40, maxKelembabanTanah: 60,
                        minKelembabanUdara: 40, maxKelembabanUdara: 60,
                        desc: "Bayam adalah tumbuhan yang biasa ditanam untuk dikonsumsi daunnya sebagai sayuran hijau. Tumbuhan ini dikenal sebagai sayuran sumber zat besi yang penting bagi tubuh",
                        panduanPerawatan: [
                            "1. Tanam bayam selama cuaca dingin pada musim semi dan musim gugur",
                            "2. Jarak tanam bayam 12 inci di tanah yang subur dan dikeringkan dengan baik dengan pH 6,5 hingga 7,0",
                            "3. Mulailah musim tanam dengan mencampurkan beberapa inci kompos tua atau bahan organik kaya lainnya ke dalam tanah asli Anda",
                            "4. Periksa kelembaban tanah sesering mungkin atau pertimbangkan untuk menggunakan selang hujan untuk menjaga tingkat kelembaban tetap konsisten",
                            "5. Untuk produksi daun yang lembut dan cepat, beri makan secara teratur dengan makanan nabati yang larut dalam air",
                            "6. Panen bayam dimulai dengan daun terluar setelah daun cukup besar untuk dimakan",
                            "7. Dalam pemeliharaan benih / bibit perlu dilakukan penyiraman dengan teratur dan hati-hati",
                            "8. Setelah bibit tumbuh dan ada benih yang terserang hama / penyakit maka perlu disemprot dengan pestisida dengan dosis rendah",
                            "9. Tanaman bayam dipanen sekitar 20-21 hari setelah tanam dan pemanenan bayam dilakukan dengan cara dicabut atau dengan pemotongan batang bayam"],
                        tips: [
                            "1. Tanaman bayam menghendaki tanah yang gembur dan subur",
                            "2. Jenis tanah yang sesuai adalah yang penting kandungan haranya terpenuhi",
                            "3. pH tanah yang cocok adalah 6-7",
                            "4. Kelerangan lahan untuk budidaya tanaman bayam adalah sekitar 15 – 45 derajat",
                            "5. Curah hujan untuk tanaman bayam mencapai 1500 mm/tahun"])
                    
                case .tomatCeri:
                    return TanamanBaru(
                        namaTanaman: "Tomat Ceri",
                        imageTanaman: "iconTomat",
                        difficultyTanaman: "Medium",
                        harvestTime: "60-100 hari",
                        minSuhu: 16, maxSuhu: 27,
                        minSun: 00, maxSun: 00,
                        minKelembabanTanah: 80, maxKelembabanTanah: 100,
                        minKelembabanUdara: 65, maxKelembabanUdara: 78,
                        desc: "Tomat ceri adalah jenis tomat bulat yang lebih kecil dibandingkan tomat biasa, tomat ceri berasal dari campuran genetik antara tomat liar dengan tomat domestik kebun. Tomat ceri biasanya digunakan sebagai salad, dipanggang dan dijadikan soup maupun saus. Tomat ceri bermanfaat dalam mengontrol tekanan darah, menurunkan berat badan dan melindungi diri dari radikal bebas.",
                        panduanPerawatan: [
                            "1. Siram dengan air secukupnya dan secara teratur hingga tanah lembab dan jangan sampai tergenang (1-2 kali per minggu)",
                            "2. Pangkas anak daun disekitar buah (jika buah sudah mulai muncul) agar anak daun tersebut tidak menjadi batang",
                            "3. Jemur tanaman tomat ceri dengan teratur (7-8 jam per hari dengan sinar matahari penuh)",
                            "4. Berikan tanaman tomat dengan pupuk atau kompos setiap dua minggu, dimulai ketika buah tomat berdiameter sekitar 2,5 cm."],
                        tips: [
                            "1. pH tanah 5.5 - 7",
                            "2. Media tanah jangan sampai mengenang ataupun kering pecah-pecah",
                            "3. Siram tanaman tomat di pagi hari. Ini memberi tanaman kelembapan yang dibutuhkan untuk melewati hari yang panas. Hindari menyiram di sore atau di malam hari",
                            "4. Berikan mulsa (material penutup tanaman untuk menjaga kelembapan tanah serta menekan pertumbuhan gulma dan penyakit) lima minggu setelah tomat ditanam",
                            "5. Siapkan kayu/kawat untuk menopang tanaman nantinya. Ukuran 1-2 m sekitar 2-4batang",
                            "6. Untuk membantu tomat melewati masa-masa kekeringan, temukan beberapa batu pipih dan letakkan satu di samping setiap tanaman. Batuan mencegah air menguap dari tanah",
                            "7. Saat tanaman tumbuh, pangkas semua daun bagian bawah. Ini membantu mencegah penyakit menyebar dari tanah ke dedaunan"])
                    
                case .cabai:
                    return TanamanBaru(
                        namaTanaman: "Cabai",
                        imageTanaman: "iconCabai",
                        difficultyTanaman: "Hard",
                        harvestTime: "75-85 hari",
                        minSuhu: 24, maxSuhu: 28,
                        minSun: 6, maxSun: 8,
                        minKelembabanTanah: 60, maxKelembabanTanah: 80,
                        minKelembabanUdara: 80, maxKelembabanUdara: 89,
                        desc: "Tanaman Cabai merah adalah tumbuhan perdu dengan rasa buah pedas yang disebabkan oleh kandungan kapsaisin. Cabai memiliki beberapa manfaat kesehatan yang salah satunya adalah zat capsaicin yang berfungsi dalam mengendalikan penyakit kanker. Selain itu kandungan vitamin C yang cukup tinggi pada cabai dapat memenuhi kebutuhan harian setiap orang",
                        panduanPerawatan: [
                            "1. Lakukan penyiraman pada tanaman cabai secara berkala",
                            "2. Berikan pupuk pada tanaman cabai sesuai dengan kebutuhan",
                            "3. Membersihkan lingkungan sekitar tanaman cabai agar tidak terganggu oleh hama",
                            "4. Jaga kelembapan, suhu, sinar matahari, serta kebutuhan lainnya menggunakan IoT Plantara agar tanaman dapat tumbuh secara optimal",
                            "5. Tanaman cabai dapat dipanen setelah 80-90 hari"],
                        tips: [
                            "1. Ketika tanaman cabai berusia satu bulan, berikan pupuk kimia atau NPK. Kemudian, siram media tanam dengan larutan pupuk sebanyak 200 ml setiap 10 hari sekali",
                            "2. Panen tanaman cabai sebaiknya dilakukan pada cuaca cerah dan dilakukan setiap seminggu sekali",
                            "3. Dalam memilih benih tanaman cabai yang baik, rendam terlebih dahulu benih tanaman cabai dalam air bersuhu sekitar 45-50 derajat celsius selama satu jam. Setelah itu, pilih benih cabai yang mengendap di bawah air",
                            "4. Saat terdapat hama yang menyerang tanaman cabai, ambil dan singkirkan segera sebelum menimbulkan kerusakan yang lebih parah"])
                    
                case .pakcoy:
                    return TanamanBaru(
                        namaTanaman: "Pakcoy",
                        imageTanaman: "iconPakcoy",
                        difficultyTanaman: "Easy",
                        harvestTime: "40-50 hari",
                        minSuhu: 15, maxSuhu: 30,
                        minSun: 4, maxSun: 5,
                        minKelembabanTanah: 00, maxKelembabanTanah: 00, /* MASIH 0 */
                        minKelembabanUdara: 80, maxKelembabanUdara: 90,
                        desc: "Pakcoy adalah jenis sayuran yang berasal dari famili cruciferous dan berasal dari satu keluarga yang sama dengan brokoli, kubis, dan kembang kol. Karena termasuk sayuran hijau. Pakcoy mengandung berbagai nutrisi penting yang bermanfaat baik bagi tubuh.",
                        panduanPerawatan: [
                            "1. Siramlah dengan teratur dan pastikan tanah tetap lembab",
                            "2. Simpan di tempat yang tidak terkena sinar matahari langsung",
                            "3. Jauhkan dari gangguan hewan, seperti burung, ayam dan lainnya"],
                        tips: [
                            "1. Hati-hati dengan sinar matahari langsung. Daun pakcoy bisa terbakar karena sinar matahari yang terlalu panas.",
                            "2. Siram pakcoy menggunakan semprotan air setiap pagi dan sore hari",
                            "3. Selama seminggu pertama, jauhkan dari sinar matahari langsung. Simpanlah di tempat teduh",
                            "4. Setelah seminggu, pot atau polybag pakcoy bisa dipindahkan pada tempat yang terkena sinar matahari sepanjang hari",
                            "5. Segera dicabut jika tanaman pakcoy siap dipanen. Hati-hati saat mencabutnya, jangan sampai akarnya patah. Gunakan sendok atau sekop untuk mempermudah proses pencabutan",
                            "6. Tepuk-tepuk bagian media tanam sekitar akar pakcoy yang sudah dikubur. Jangan terlalu keras. Fungsinya, agar pakcoy tidak miring saat disiram air"])
                    
                case .sawi:
                    return TanamanBaru(
                        namaTanaman: "Sawi",
                        imageTanaman: "iconSawi",
                        difficultyTanaman: "Hard",
                        harvestTime: "40-70 hari",
                        minSuhu: 15, maxSuhu: 32,
                        minSun: 10, maxSun: 13,
                        minKelembabanTanah: 00, maxKelembabanTanah: 00, /* MASIH 0 */
                        minKelembabanUdara: 80, maxKelembabanUdara: 90,
                        desc: "Sawi adalah tumbuhan yang dimanfaatkan daun atau bunganya sebagai bahan pangan, baik segar maupun diolah. Sawi mencakup beberapa spesies Brassica yang kadang-kadang mirip satu sama lain.",
                        panduanPerawatan: [
                            "1. lakukan penyiraman secara rutin agar tetap lembab",
                            "2. Lakukan Penjarangan atau proses pemotongan tanaman yang dilakukan ketika tanaman yang tumbuh terlalu rapat, proses ini dilakukan setelah 15 hari",
                            "3. Jika ada tanaman yang mati atau terserang penyakit, segeralah untuk menggantinya dengan bibit lain",
                            "4. Lakukan Penyiangan untuk membersihkan tanaman gulma yang mengganggu pertumbuhan sawi",
                            "5. Setelah tanaman sawi berusia tiga minggu, Anda bisa melakukan pemupukan kembali",
                            "6. Jangan biarkan sawi terkena sinar matahari langsung, tetapi pastikan sawi mendapatkan sinar matahari yang cukup selama 10-13 jam sehari",
                            "7. Pastikan sawi ditanam di udara yang lembab dengan kelembaban berkisar pada 80%-90%"],
                        tips: [
                            "1. Tambahkan kapur pertanian apabila tingkat keasaman tanah tinggi. Setelah ditambahkan kapur, diamkan tanah selama dua minggu sebelum ditanami sawi",
                            "2. Jangan pilih bibit yang tidak tenggelam saat direndam ke dalam air, karena menghasilkan sawi yang tidak maksimal",
                            "3. Jika bibit diambil dari biji yang diambil langsung dari tanaman aslinya, harus berumur paling tidak 70 hari Semai Bibit Sawi"])
                    
                case .kangkung:
                    return TanamanBaru(
                        namaTanaman: "Kangkung",
                        imageTanaman: "iconKangkung",
                        difficultyTanaman: "Easy",
                        harvestTime: "50-60 hari",
                        minSuhu: 24, maxSuhu: 34,
                        minSun: 3, maxSun: 4,
                        minKelembabanTanah: 80, maxKelembabanTanah: 100,
                        minKelembabanUdara: 57, maxKelembabanUdara: 59,
                        desc: "Kangkung merupakan sayuran daun yang berbunga dengan warna yang beragam dari putih sampai merah muda, dan batangnya dari warna hijau sampai ungu. Daunnya merupakan sumber protein, vitamin A, besi dan kalsium.",
                        panduanPerawatan: [
                            "1. Kombinasi penggunaan pupuk organik dan anorganik dapat meningkatkan hasil dan memelihara kesuburan tanah",
                            "2. Kangkung membutuhkan banyak air karena berbatang basah",
                            "3. Penyakit yang biasa menyerang kangkung adalah: karat putih (Albugo ipomoeae-panduratae), aphids dan thrips. Pengendalian dapat dilakukan dengan cara bercocok tanam yang baik seperti rotasi tanaman, sanitasi, jarak tanam yang cukup, penyiraman di antara bedengan",
                            "4. Penggunaan pestisida sebaiknya dihindarkan, kecuali bila serangan begitu tinggi"],
                        tips: [
                            "1. Saat menanam harus diberikan jarak 40cm",
                            "2. Jika tanah tempat kangkung ditanam bersifat asam, berikan kapur dolomit agar bisa menetralkan tanah",
                            "3. Jika tanaman kangkung terlihat layu dan menguning di siang hari, perlu disiram dengan takaran air yang cukup. Kurangnya intensitas penyiraman air di siang hari dapat membuat tanaman kangkung mati."])
                    
                case .selada:
                    return TanamanBaru(
                        namaTanaman: "Selada",
                        imageTanaman: "iconSelada",
                        difficultyTanaman: "Medium",
                        harvestTime: "30-45 hari",
                        minSuhu: 00, maxSuhu: 00, /* MASIH 0 */
                        minSun: 14, maxSun: 16,
                        minKelembabanTanah: 80, maxKelembabanTanah: 100,
                        minKelembabanUdara: 65, maxKelembabanUdara: 78,
                        desc: "Selada adalah tumbuhan sayur yang biasa ditanam di daerah beriklim sedang maupun daerah tropika. Kegunaan utama adalah sebagai salad. Produksi selada dunia diperkirakan sekitar 3 juta ton.",
                        panduanPerawatan: [
                            "1. Rawatlah tanaman dengan menyiram, menyiangi gulma, dan memastikan sistem drainasenya baik",
                            "2. Penyiraman dapat dilakukan dua kali sehari, setiap pagi dan sore hari",
                            "3. Jika sedang musim hujan, kurangi frekuensi penyiraman agar tanah tidak terlalu basah"],
                        tips: [
                            "1. Lakukan pemanenan selada di pagi hari",
                            "2. Cabutlah selada sampai ke akarnya",
                            "3. Pilah selada dengan daun yang masih segar",
                            "4. Buang daun selada jika daun selada sudah layu atau kering",
                            "5. Cuci selada dengan air mengalir hingga bersih",
                            "6. Kelompokkan selada berdasarkan besar daun yang sama",
                            "7. Kumpulkan dalam satu keranjang bersih"])
                    
                case .kemangi:
                    return TanamanBaru(
                        namaTanaman: "Kemangi",
                        imageTanaman: "iconKemangi",
                        difficultyTanaman: "Hard",
                        harvestTime: "42 hari",
                        minSuhu: 10, maxSuhu: 21,
                        minSun: 6, maxSun: 8,
                        minKelembabanTanah: 00, maxKelembabanTanah: 00, /* MASIH 0 */
                        minKelembabanUdara: 00, maxKelembabanUdara: 00, /* MASIH 0 */
                        desc: "Kemangi adalah tanaman kecil yang daunnya biasa dimakan sebagai lalap. Aroma daunnya khas dan kuat namun lembut dengan sentuhan aroma limau. Daun kemangi merupakan salah satu bumbu bagi pepes. Sebagai lalapan, daun kemangi biasanya dimakan bersama-sama daun kubis, irisan ketimun, dan sambal untuk menemani ayam atau ikan goreng.",
                        panduanPerawatan: [
                            "1. Jangan lupa siram tanaman dan pastikan tanahnya lembab. Tanaman kemangi menyukai kelembapan",
                            "2. Selama periode kering di musim panas, seringlah sirami tanaman kemangi",
                            "3. Setelah bibit menghasilkan enam daun pertama, pangkas di atas set kedua. Ini mendorong tanaman untuk mulai bercabang, menghasilkan lebih banyak daun untuk dipanen",
                            "4. Setiap kali cabang memiliki enam sampai delapan daun, ulangi pemangkasan cabang kembali ke set daun pertama mereka",
                            "5. Setelah sekitar 6 minggu, jepit bagian tengah pucuk untuk mencegah pembungaan awal. Jika bunga tumbuh, dipotong saja"],
                        tips: [
                            "1. Jika Anda tinggal di daerah yang panas, gunakan mulsa di sekitar tanaman (mulsa akan membantu menahan kelembapan dan menekan gulma)",
                            "2. Jika cuaca dingin atau bersalju pastikan untuk memanen kemangi Anda terlebih dahulu, karena suhu yang dingin akan merusak tanaman Anda"])
                }
    }
}   

class KebutuhanTanamanViewModel{
    func getKebutuhanTanaman(jenisTanaman: String) -> KebutuhanTanaman{
        let dataTanaman = PlantType(rawValue: jenisTanaman)?.getsDataTanaman(with: jenisTanaman)
        let suhuTanaman: String = "\(dataTanaman?.minSuhu ?? 0)°C - \(dataTanaman?.maxSuhu ?? 0)°C"
        let tanahTanaman: String = "\(dataTanaman?.minKelembabanTanah ?? 0)RH - \(dataTanaman?.maxKelembabanTanah ?? 0)RH"
        let udaraTanaman: String = "\(dataTanaman?.minKelembabanUdara ?? 0)RH - \(dataTanaman?.maxKelembabanUdara ?? 0)RH"
        let sinarTanaman: String = "\(dataTanaman?.minSun ?? 0)Lx - \(dataTanaman?.maxSun ?? 0)Lx"
        
        let dataKebutuhanTanaman = KebutuhanTanaman(kebutuhanSuhu: suhuTanaman, kebutuhanSun: sinarTanaman, kebutuhanTanah: tanahTanaman, kebutuhanUdara: udaraTanaman)
        
        return dataKebutuhanTanaman
    }
}
