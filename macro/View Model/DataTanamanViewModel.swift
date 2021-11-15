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
    
    func getDataTanaman() -> TanamanBaru{
        switch self{
        case .bayam:
            return TanamanBaru(
                namaTanaman: "Bayam",
                imageTanaman: "iconBayam",
                difficultyTanaman: "Easy",
                harvestTime: "20-21 hari",
                minSuhu: 16, maxSuhu: 20,
                minSun: 3, maxSun: 4,
                minKelembabanTanah: 40, maxKelembabanTanah: 60,
                minKelembabanUdara: 40, maxKelembabanUdara: 60,
                desc: "Bayam adalah tumbuhan yang biasa ditanam untuk dikonsumsi daunnya sebagai sayuran hijau. Tumbuhan ini dikenal sebagai sayuran sumber zat besi yang penting bagi tubuh.",
                panduanPerawatan: [],
                tips: [])
            
        case .tomatCeri:
            return TanamanBaru(
                namaTanaman: "Tomat Ceri",
                imageTanaman: "iconTomat",
                difficultyTanaman: "Medium",
                harvestTime: "60-100 hari",
                minSuhu: 16, maxSuhu: 27,
                minSun: 00, maxSun: 00, /* MASIH 0 */
                minKelembabanTanah: 80, maxKelembabanTanah: 100,
                minKelembabanUdara: 65, maxKelembabanUdara: 78,
                desc: "Tomat ceri adalah jenis tomat bulat yang lebih kecil dibandingkan tomat biasa, tomat ceri berasal dari campuran genetik antara tomat liar dengan tomat domestik kebun. Tomat ceri biasanya digunakan sebagai salad, dipanggang dan dijadikan soup maupun saus. Tomat ceri bermanfaat dalam mengontrol tekanan darah, menurunkan berat badan dan melindungi diri dari radikal bebas.",
                panduanPerawatan: [],
                tips: [])
            
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
                panduanPerawatan: [],
                tips: [])
            
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
                panduanPerawatan: [],
                tips: [])
            
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
                panduanPerawatan: [],
                tips: [])
            
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
                panduanPerawatan: [],
                tips: [])
            
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
                panduanPerawatan: [],
                tips: [])
            
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
                panduanPerawatan: [],
                tips: [])
        }
    }
}
