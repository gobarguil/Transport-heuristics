/*********************************************
 * OPL 12.7.1.0 Model
 * Author: Quentin
 * Creation Date: 6 déc. 2017 at 15:36:35
 *********************************************/

 int nbSites= ... ;
 range N = 1..nbSites;
 int k= ... ; //max number of hubs
 float C [N][N]= ... ; //distances matrix
 float C0 = ... ; // cost of hub creation
 float Ct = ... ; // cost of travelling by kilometer
 
 dvar boolean y[N]; // i is a hub or not
 dvar boolean x[N][N]; // ij is used or not
 
 minimize (sum (i in N, j in N) (Ct*C[i][j]*x[i][j])) + (sum (i in N) C0*y[i]);
 
 subject to {
 
 	sum (i in N) y[i] <= k ;
 	
 	forall (j in N)
 	  sum (i in N) x[i][j] == 1;
    
  forall (i in N)
 	  sum (j in N) x[i][j] == 1;
  
 }
