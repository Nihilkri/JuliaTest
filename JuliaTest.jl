function matrixhelp()
	#l = [1]
	#l = [l 2]
	#l = [l 3]
	#l = [l; 4 5 6]

	a = [1 2]
	b = [3 4]
	c = [[a;b] [5;6]]
	println(c)

end
function listpfact(n::Int)
	l = [1]
	if (n==0 | n==1) l = [n]; return l end
	if n < 0; n = -n; l = [-1 l] end; i = 2
	while n >= 2 && i <= sqrt(n)
		if rem(n,i) == 0
			l = [l i]; n = div(n,i); i = 2
		else i += 1 end
	end
	if n > 1; l = [l n] end
	return l
end
function pfact(n::Int)
	l = listpfact(n); s = ""; b = 1; e = 0
	for q in l
		if q == b; e+=1
		else 
			if e==1; s = "$s$b, " else s="$s$b^$e, " end
			b=q; e=1; 
		end
	end
	if e==1; s = "$s$b" else s="$s$b^$e" end
	#s = s[1:end-2]
	return s
end
function pyth(n::Int)
	l = Int[1;1]; s = ""
	for q in 1:(sqrt(n/2))
		a = sqrt(n-q^2) 
		if mod(a,1)==0
			l = [l [q;a]]
			s = "$s$q^2+$a^2=$(q^2+a^2), "
		end
	end
	if s==""; s="None.." end
	println(s[1:end-2])
	println(l[1:end,2:end])
	return l[1:end,2:end]
end
function listpfact(n::Complex)
	l = [1+0im]; a = real(n); b = imag(n); t = 0+0im
	if ((n==0+0im) | (n==1+0im)) l = [n]; return l end
	if b < 0; n = a-b*im; l = [l -im] end
	if a < 0; n = -a+b*im; l = [l -1] end
	i = 2

	#if ((a==0 && rem(abs(b),4)==3 && length(listpfact(b))==2)
	# || (b==0 && rem(abs(a),4)==3 && length(listpfact(a))==2))
	#end

	N = abs2(n); L = listpfact(N)
	println("n = $n")
	println("N = $N")
	println("L = $L")
	println(pyth(N))
	#println(pyth(imag(n)))
	for p in L[2:end]
		println("\np = $p")
		if p==2
			f = 1+1im
			t = n/(1+1im)
			println("t = $t")
		elseif rem(p,4)==3
			f = p
			t = n/p
			println("t = $t")
		else
			P = pyth(p)
			for i in 1:length(P[1])

			end


			#println("f = $f")
			#println("t = $t")
		end
	if (mod(real(t),1)==0 && mod(imag(t),1)==0); l = [l f]; n = complex(Int(real(t)),Int(imag(t))) end


	end
	if n != 0+0im; l = l[1:end,2:end]; l = [n l] end
	println("l = $l")
end
function pfact(n::Complex)

end

println("\nHi!")
#i=sqrt(complex(-1))
#a = complex(1+2i)
#b = complex(3+4i)
#a*b
#p = pfact(377)
#println("p = $p")
#println(typeof(p))
#a = 16+11*im
#a = Complex(16,11)
#println(pfact(a))
#pyth(a)
#for a in 5:6; for b in 5:6
#println("$(complex(a,b)) = $(listpfact(complex(a,b)))\n")
#end; end
listpfact(complex(361,-1767))
# 361-1767im = (1+im)(2+im)(4+im)(19+0im)(-7-2im)