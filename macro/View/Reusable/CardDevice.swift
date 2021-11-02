import SwiftUI

struct CardDevice: View {
    
    @State var deviceName = "Device Bayam 1"
    @State var jenisTanaman = "Bayem lah ya"
    @State var valueProgressBar: Float = 0.0
    
    var body: some View {
        VStack{
            VStack (alignment: .leading){
                //INI BAGIAN ATASNYA YANG GAMBAR DAN TULISAN
                HStack{
                    //INI BAGIAN GAMBAR SAMA WARNINGNYA
                    ZStack (alignment: .topTrailing){
                        Image(systemName: "plus.square.fill")
                            .font(.system(size: 90))
                            .foregroundColor(Color.green)
                        Image(systemName: "sun.max")
                            .font(.system(size: 20))
                            .foregroundColor(Color.red)
                    }
                    //INI BAGIAN DESKRIPSI DEVICE NYA
                    VStack (alignment: .leading){
                        Text("\(deviceName)")
                            .font(.system(size: 20, weight: .semibold))
                            .frame(width: 200, height: 20, alignment: .leading)
                        Text("\(jenisTanaman)")
                            .font(.system(size: 14))
                            .frame(width: 200, height: 15, alignment: .leading)
                        
                        //BAGIAN LOKASI DAN KALENDER
                        HStack (spacing: 15){
                            HStack (spacing: 1){
                                Image(systemName: "mappin.and.ellipse")
                                Text("Ruang Tamu")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                                    .frame(width: 80, height: 10, alignment: .leading)
                            }
                            
                            HStack (spacing: 1){
                                Image(systemName: "calendar")
                                Text("14 hari")
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
                HStack (spacing: 15){
                    //INI BAGIAN KIRI (CAHAYA SAMA AIR)
                    VStack (alignment: .leading){
                        HStack{
                           // ProgressBar(progress: valueProgressBar, color: Color.orange, image: "sun.max", lineWidth: 7.0)
                               // .frame(width: 30, height: 30)
                            
                            VStack (alignment: .leading){
                                Text("Sinar Matahari")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                HStack{
                                    Text("370 Lx")
                                        .font(.system(size: 12))
                                        .frame(width: 40,  alignment: .leading)
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(Color.red)
                                }
                            }
                        }.padding(.bottom, 5)
                        
                        HStack{
                            //ProgressBar(progress: valueProgressBar, color: Color.blue, image: "humidity.fill", lineWidth: 7.0)
                                //.frame(width: 30, height: 30)
                            
                            VStack (alignment: .leading){
                                Text("Kelembapan Udara")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                HStack{
                                    Text("70%")
                                        .font(.system(size: 12))
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
                            //ProgressBar(progress: valueProgressBar, color: Color.red, image: "thermometer", lineWidth: 7.0)
                                //.frame(width: 30, height: 30)
                            
                            VStack (alignment: .leading){
                                Text("Suhu")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                HStack{
                                    Text("37 C")
                                        .font(.system(size: 12))
                                        .frame(width: 40, alignment: .leading)
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(Color.red)
                                }
                            }
                        }.padding(.bottom, 5)
                        
                        HStack{
                           // ProgressBar(progress: valueProgressBar, color: Color.green, image: "drop.fill", lineWidth: 7.0)
                                //.frame(width: 30, height: 30)
                            
                            VStack (alignment: .leading){
                                Text("Kelembapan Tanah")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                                
                                HStack{
                                    Text("10%")
                                        .font(.system(size: 12))
                                        .frame(width: 40, alignment: .leading)
                                    Image(systemName: "exclamationmark.triangle")
                                        .foregroundColor(Color.red)
                                }
                            }
                        }
                    }
                }
                //.frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            .background(RoundedRectangle(cornerRadius: 16)
                            .fill(Color(#colorLiteral(red: 0.9927867055, green: 0.9402000308, blue: 0.8708111644, alpha: 1))))
            .frame(maxWidth: .infinity)
            .clipped()
            .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 8)
            .padding(.horizontal, 20)
        }
    }
}

struct CardDevice_Previews: PreviewProvider {
    static var previews: some View {
        CardDevice()
    }
}
