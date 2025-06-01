Giriş

Bu proje, Linux için basit bir paket yöneticisi yazmak isteyen acemiler için hazırlandı.
Amacımız:

    Paketlerin nasıl yönetildiğini anlamak,

    Basit bir yükleyici yazmak,

    Sonra bu yükleyiciyi geliştirip profesyonel hale getirmek.

1. Günün Hedefi

    Paket yöneticisi nedir? Temel mantığı nedir?

    Bash script kullanarak basit bir paket yükleyici yazmak,

    Proje klasör yapısını oluşturmak,

    Git ve GitHub’a kodu yüklemek.

Paket Yöneticisi Nedir?

Paket yöneticisi, yazılım paketlerini kolayca yüklememizi, güncellememizi ve kaldırmamızı sağlayan bir araçtır.
Örneğin: apt (Debian), yum (RedHat), pacman (Arch Linux) gibi.

Bizim projemiz çok daha basit olacak ama temel prensipler aynı.
1. Temel Proje Klasör Yapısı

Bilgisayarında bir klasör aç: KurPackageManager

İçinde şunlar olacak:

KurPackageManager/
├── packages/         # Paket dosyalarının olduğu yer
│   └── example.pkg   # Örnek paket dosyası (bize lazım olacak)
├── kur.sh            # Ana yükleyici scriptimiz
└── README.md         # Projenin açıklaması ve kullanımı

2. Basit Paket Yükleyici Scripti (kur.sh)

kur.sh dosyasını oluştur ve içine şunu yaz:

#!/bin/bash

# Paket yükleme fonksiyonu
function install_package() {
    local package_name=$1

    if [ -f "packages/${package_name}.pkg" ]; then
        # Burada gerçek yükleme işlemi olabilir, biz sadece kopyalama yapacağız örnek olarak
        cp packages/${package_name}.pkg /usr/local/bin/
        echo "Paket '${package_name}' başarıyla yüklendi."
    else
        echo "Hata: Paket '${package_name}' bulunamadı!"
    fi
}

# Komut satırından parametre kontrolü
if [ "$#" -ne 1 ]; then
    echo "Kullanım: $0 <paket_adı>"
    exit 1
fi

install_package $1

Bu script ne yapar?

    packages klasöründe .pkg uzantılı dosya arar,

    Bulursa /usr/local/bin/ dizinine kopyalar,

    Değilse hata mesajı verir.

3. Paket Dosyası Oluşturma

packages klasörüne example.pkg diye boş bir dosya oluştur (örnek amaçlı).

touch packages/example.pkg

4. Çalıştırma

Terminalde KurPackageManager klasörüne gel:

cd KurPackageManager
chmod +x kur.sh  # Scripti çalıştırılabilir yap
./kur.sh example  # example paketini yükle

5. Git ve GitHub’a Yükleme

    Git kurulumu ve ayarları yapıldıysa:

git init
git add .
git commit -m "Gün 1: Basit paket yükleyici eklendi"
git branch -M main
git remote add origin https://github.com/Xtrexter/KurPackageManager.git
git push -u origin main

6. Sonraki Adımlar

    Paket içeriği nasıl olmalı? (Dosya yapısı)

    Paket bağımlılıklarını nasıl kontrol ederiz?

    Güncelleme kontrolü nasıl yapılır?

    Daha gelişmiş yükleme fonksiyonları nasıl yazılır?

Özet

Bugün:

    Paket yöneticisinin temel mantığını öğrendik,

    Basit bir yükleyici scripti yazdık,

    Proje klasörünü kurduk,

    İlk kodu GitHub’a yükledik.
