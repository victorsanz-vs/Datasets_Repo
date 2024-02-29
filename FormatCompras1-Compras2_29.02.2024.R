# nombre: victor sanz arevalo
# fecha: 29-02-2024

tCompras<-read.csv(file.choose(),header=TRUE,sep=",")
dim(tCompras)
head(tCompras)
names(tCompras)

tComprasPlus<-data.frame(Genero=tCompras$Genero,Edad=tCompras$Edad,
Efectivo=tCompras$Paga_en_efectivo,Online=tCompras$Compra_on.line,
GastoMedio=tCompras$Gasto_medio_mensual,CasoMedio="")

names(tCompras)
names(tComprasPlus)
head(tComprasPlus)
dim(tComprasPlus)

summary(tComprasPlus)
class(tComprasPlus)

i<-1
while(i<=length(tComprasPlus$GastoMedio)){
	if(tComprasPlus$GastoMedio[i]<100){
		tComprasPlus$CasoMedio[i]<-"M"}
	if(tComprasPlus$GastoMedio[i]<=150 & tComprasPlus$GastoMedio[i]>100){
		tComprasPlus$CasoMedio[i]<-"V"}
	if(tComprasPlus$GastoMedio[i]<=200 & tComprasPlus$GastoMedio[i]>150){
		tComprasPlus$CasoMedio[i]<-"A"}
	if(tComprasPlus$GastoMedio[i]>200){
		tComprasPlus$CasoMedio[i]<-"R"}
	i<-i+1}

summary(tComprasPlus)
head(tComprasPlus)
names(tComprasPlus)[6]="G"
names(tComprasPlus)
head(tComprasPlus)

tCompras2<-tComprasPlus
write.table(tCompras2,file="D:\\githubDrop\\Datasets_Repo\\Compras2.csv",
sep=",",col.names=TRUE,row.names=FALSE)