function [valeur ] = valeurPolynome( x ,coefs)

l=length(coefs)
puissance = 0:l-1
tx=repmat(x,l,1)
valeur=coefs*(tx.^transpose(puissance))

end

