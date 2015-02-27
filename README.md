-SPECTRE
=======

These files have been cherry-picked from S. Grullon's SPECTRE code and converted to work with RAT-5. 
They hopefully represent the SPECTRE setup.

12/1/2015 - JW - fixed up positions so we can simulate 90Y in capillary 
droplet in tank, and Co60 either inside or stuck to outside of tank (no 
source disk just point source for Co60) inbetween trigger PMT and the HQE PMT to the right.

Setup simulates 3*HQE PMTs[1,2,3] and a smaller trigger PMT[0]. Only get 
MC information out.
I think to analyse we just plot the MCPMT QEs.
