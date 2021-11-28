import SwiftUI


struct CardDevice: View {
    
    @Binding var statusTanaman: StatusTanaman
    var deviceData: DeviceData
    @State var valueProgressBar: Double = 70
    
    var body: some View {
        NavigationLink(destination: DeviceDetailPage(statusTanaman: $statusTanaman)) {
            VStack (alignment: .leading){
                //INI BAGIAN ATASNYA YANG GAMBAR DAN TULISAN
                HStack{
                    //INI BAGIAN GAMBAR SAMA WARNINGNYA
                    ZStack (alignment: .topTrailing){
                        Image("iconBayam")
                            .resizable()
                            .frame(width: 111, height: 111)
                            //.font(.system(size: 90))
                        
                    }
                    //INI BAGIAN DESKRIPSI DEVICE NYA
                    VStack (alignment: .leading){
                        Text(deviceData.namaDevice ?? "")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(Color.black)
                            .frame(width: 230, height: 20, alignment: .leading)
                        Text(deviceData.namaTanaman ?? "")
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                            .frame(width: 200, height: 15, alignment: .leading)
                        
                        //BAGIAN LOKASI DAN KALENDER
                        HStack (spacing: 15){
                            HStack (spacing: 1){
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(Color.black)
                                Text(deviceData.lokasiTanaman ?? "")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                    .frame(width: 80, height: 10, alignment: .leading)
                            }
                            
                            HStack (spacing: 1){
                                Image(systemName: "calendar")
                                    .foregroundColor(Color.black)
                                Text("\(Calendar.current.dateComponents([.day], from: deviceData.tanggalMenanam ?? Date(), to: Date()).day ?? 0) Days")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                    .frame(width: 60, height: 10, alignment: .leading)
                            }
                        }.padding(.top, 1)
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                .padding(.leading, 5)

                //INI BAGIAN BAWAH YANG SENSORNYA
                HStack{
                    //INI BAGIAN KIRI (CAHAYA SAMA AIR)
                    VStack (alignment: .leading){
                        HStack{
                            CircularProgressBar(percentage: $valueProgressBar, circularProgressBarStyle: .sinar, amount: $valueProgressBar, isCardView: true, diameter: 25)
                            
                            VStack (alignment: .leading){
                                Text("Sinar Matahari")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                HStack{
                                    Text("370 Lx")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.black)
                                        .frame(width: 40,  alignment: .leading)
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(Color.red)
                                }
                            }
                        }.padding(.bottom, 5)
                        
                        HStack{
                            CircularProgressBar(percentage: $statusTanaman.kelembabanUdara, circularProgressBarStyle: .udara, amount: $valueProgressBar, isCardView: true, diameter: 25)
                            
                            VStack (alignment: .leading){
                                Text("Kelembapan Udara")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                HStack{
                                    Text("\(String(format: "%.f", statusTanaman.kelembabanUdara))%")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.black)
                                        .frame(width: 40,  alignment: .leading)
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(Color.red)
                                }
                            }
                        }
                    }
                    
                    //INI BAGIAN KANAN (SUHU SAMA SOIL)
                    VStack(alignment: .leading){
                        HStack{
                            CircularProgressBar(percentage: $statusTanaman.suhu, circularProgressBarStyle: .suhu, amount: $valueProgressBar, isCardView: true, diameter: 25)
                            
                            VStack (alignment: .leading){
                                Text("Suhu")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                HStack{
                                    Text("\(String(format: "%.f", statusTanaman.suhu))°C")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.black)
                                        .frame(width: 40, alignment: .leading)
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(Color.red)
                                }
                            }
                        }.padding(.bottom, 5)
                        
                        HStack{
                            CircularProgressBar(percentage: $statusTanaman.kelembabanTanah, circularProgressBarStyle: .tanah, amount: $valueProgressBar, isCardView: true, diameter: 25)
                            
                            VStack (alignment: .leading){
                                Text("Kelembapan Tanah")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                HStack{
                                    Text("\(String(format: "%.f", statusTanaman.kelembabanTanah))%")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.black)
                                        .frame(width: 40, alignment: .leading)
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(Color.red)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 16)
                            .fill(Warna.primary))
            
            .clipped()
            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 8)
            .padding(.horizontal, 20)
        }
    }
}
