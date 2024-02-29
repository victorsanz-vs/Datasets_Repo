# nombre:	victor sanz arevalo
# fecha:	29-02-2024

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
write.table(tCompras2,file="D:\\githubDrop\\Datasets_Repo\\datasets_compras\\Compras2.csv",sep=",",col.names=TRUE,row.names=FALSE)

# Reglas sacadas a partir del algoritmo J48 en Weka:
# REGLA1: Edad>65->A			p_acierto: 478/488
# REGLA2: Edad=65|Genero="H"->A		p_acierto: 6/7
# REGLA3: 61<=Edad<=64|Genero='M'->R	p_acierto: 1
# REGLA4: 35<=Edad<=60--'R'		p_acierto: practicamente 1
# REGLA5: 31<=Edad<=35|Genero='M'->R	p_acierto: 0.99
# REGLA6: 30<=Edad<=35|Genero='H'->A	p_acierto: 0.85
# REGLA7: Edad<=19->M			p_acierto: 0.88