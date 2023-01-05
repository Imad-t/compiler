/****************CREATION DE LA TABLE DES SYMBOLES ******************/
/***Step 1: Definition des structures de données ***/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct // struct for IDF & Const
{
  int state;
  char name[20];
  char code[20];
  char type[20];
  float val;
} element;

typedef struct //seperateur & mot_clee 
{ 
   int state; 
   char name[20];
   char type[20]; // code 
} elt;

element tab[1000]; //tab: IDF et constantes
elt tabs[40],tabm[40]; //tabs: séparateurs, tabm:mots clés
int cpt, cpts, cptm;

/***Step 2: initialisation de l'état des cases des tables des symbloles***/
/*0: la case est libre    1: la case est occupée*/

void initialisation()
{

//initialiser state à 0 dans toutes les tables. Ex: tab[i].state=0;
//initialiser les compteurs à 0
//printf("Init\n");
int i;
for(i=0;i<1000;i++) tab[i].state=0;
for(i=0;i<40;i++) {tabs[i].state=0; tabm[i].state=0;}
 
cpt=0; cpts=0; cptm=0;

}

/***Step 4: insertion des entititées lexicales dans les tables des symboles ***/

void inserer (char entite[], char code[],char type[],float val,int i, int y)
{
  switch (y)
 { 
   case 0:/*insertion dans la table des IDF et CONST
			mettre state à 1, incrémenter cpt;
			insérer: name, code, type, val*/
       tab[i].state=1;
       strcpy(tab[i].name,entite);
       strcpy(tab[i].code,code);
	     strcpy(tab[i].type,type);
	    tab[i].val=val;
	   cpt++;
	   break;

   case 1:/*insertion dans la table des mots clés
			mettre state à 1, incrémenter cptm;
			insérer: name, code*/
       tabm[i].state=1;
       strcpy(tabm[i].name,entite);
       strcpy(tabm[i].type,code);
	   cptm++;
       break; 
    
   case 2:/*insertion dans la table des séparateurs
			mettre state à 1, incrémenter cpts
			insérer: name, code*/
      tabs[i].state=1;
      strcpy(tabs[i].name,entite);
      strcpy(tabs[i].type,code);
	  cpts++;
      break;
 }

}


/***Step 3: La fonction Rechercher permet de verifier  si l'entité existe dèja dans la table des symboles */
void rechercher (char entite[], char code[],char type[],float val,int y)	
{

int j,i;

switch(y) 
  {
   case 0:
   printf("HELLLLLLLLLO im in 0 -- idf cst \n");
			/*Chercher si entite existe dans tab: si non on appelle la fonction inserer:
			inserer(entite, code, type, val, y);*/
		//printf("Rechercher idf cst\n");
		if(cpt==0) inserer(entite,code,type,val,0,0);
		else {
				for (i=0; ((i<1000)&&(tab[i].state==1))&&(strcmp(entite,tab[i].name)!=0); i++); 
				if(i<1000)
				{
          if(strcmp(entite,tab[i].name)==0){

				   printf("Entite %s existe deja\n",entite);
          
          }else
          
				    inserer(entite,code,type,val,i,0);     
				}else
          printf("debordement de la table des IDF et Constantes");
		}
        break;

   case 1:
   printf("HELLLLLLLLLO im in 1 -- mot cle \n\n");
       //printf("Recherche mot cle, cptm=%d\n",cptm);
       /*Chercher si entite existe dans tabm: si non on appelle la fonction inserer*/
	   if(cptm==0) inserer(entite,code,type,val,0,1); 
	   else {	   
			   for(i=0;((i<40)&&(tabm[i].state==1))&&(strcmp(entite,tabm[i].name)!=0);i++); 
			   
			  // printf("i=%d\n",i);
				if(i<40)
				{ 	        
				 inserer(entite,code,type,val,i,1); 	      
				}
				else printf("Entite %s existe deja\n",entite);
	   }
        break; 
    
   case 2:
   printf("HELLLLLLLLLO im in 2 --- sep \n");
			//printf("Rechercher séparateur\n");
         /*Chercher si entite existe dans tabs: si non on appelle la fonction inserer*/
		if(cpts==0) inserer(entite,code,type,val,0,2); 
	    else {
				for (i=0;((i<40)&&(tabs[i].state==1))&&(strcmp(entite,tabs[i].name)!=0);i++); 
				if(i<40)
				{ 	        
				inserer(entite,code,type,val,i,2); 	      
				}
				else printf("Entite %s existe deja\n",entite);
		}
        break;

  }

}


/***Step 5 L'affichage du contenue de la table des symboles ***/

void afficher()
{int i;

printf("\n/***************Table des symboles IDF*************/\n");
printf("____________________________________________________________________\n");
printf("\t| Nom_Entite |  Code_Entite | Type_Entite | Val_Entite\n");
printf("____________________________________________________________________\n");
  
for(i=0;i<cpt;i++)
{	
	
    if(tab[i].state==1)
      { 
        printf("\t|%10s |%15s | %12s | %12f\n",tab[i].name,tab[i].code,tab[i].type,tab[i].val);
         
      }
}

 
printf("\n/***************Table des symboles mots cles*************/\n");

printf("_____________________________________\n");
printf("\t| NomEntite |  CodeEntite | \n");
printf("_____________________________________\n");
  
for(i=0;i<cptm;i++)
    if(tabm[i].state==1)
      { 
        printf("\t|%10s |%12s | \n",tabm[i].name, tabm[i].type);
               
      }

printf("\n/***************Table des symboles separateurs*************/\n");

printf("_____________________________________\n");
printf("\t| NomEntite |  CodeEntite    | \n");
printf("_____________________________________\n");
  
for(i=0;i<cpts;i++)
    if(tabs[i].state==1)
      { 
        printf("\t|%10s |%15s | \n",tabs[i].name,tabs[i].type );
        
      }

}
