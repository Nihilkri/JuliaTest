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
	l = Array{Int}(1,0)
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
	l = listpfact(n); s = ""; b = 1; ex = 0
	for q in l
		if q == b; ex+=1
		else 
			if ex==1; s = "$s$b, " else s="$s$b^$ex, " end
			b=q; ex=1; 
		end
	end
	if ex==1; s = "$s$b" else s="$s$b^$ex" end
	return s
end
function pyth(n::Int)
	l = Array{Int}(0,2); s = ""
	for q in 1:(sqrt(n/2))
		a = sqrt(n-q^2) 
		if mod(a,1)==0
			l = [l; [Int(q) Int(a)]]
			s = "$s$q^2+$a^2=$(q^2+a^2), "
		end
	end
	if s==""; s="None.." end
	#println(s[1:end-2])
	#if length(l)!=0 println("$l($(length(l[:,1])), $(length(l[1,:])))") end
	return l
end
function listpfact(n::Complex)
	l = Array{Complex}(1,0); a = real(n); b = imag(n); t = 0+0im
	if ((n==0+0im) || (n==1+0im)) l = [n]; return l end
	#if b < 0; n = a-b*im; l = [l -im] end
	#if a < 0; n = -a+b*im; l = [l -1] end
	i = 2

	#if ((a==0 && rem(abs(b),4)==3 && length(listpfact(b))==2)
	# || (b==0 && rem(abs(a),4)==3 && length(listpfact(a))==2))
	#end

	N = abs2(n); L = listpfact(N)
	#println("n = $n")
	#println("N = $N")
	#println("L = $L")
	#if imag(n)==0; println("pyth(n) = $(pyth(real(n)))") end
	#println("pyth(N) = $(pyth(N))")
	#println(pyth(imag(n)))
	for p in 1:length(L)
		#println("\np = $p")
		#println("L[p] = $(L[p])")
		if L[p]==2
			f = 1+1im
			t = n/f
			#println("f = $f")
			#println("t = $t")
		elseif rem(L[p],4)==3
			f = complex(L[p],0)
			t = n/f
			#println("f = $f")
			#println("t = $t")
			#if L[p] == L[p-1]; continue end
		elseif rem(L[p],4)==1
			P = pyth(L[p]); d = false
			#println("\nP = $P")
			for i in 1:length(P[:,1])
				#println("i = $i")
				#println("P[i] = $(P[i,:])")
				#println("d = $d")
				d && continue
				a = P[i,1]; b = P[i,2]
				if (a+b*im)*(a-b*im)==L[p]; a,b = b,a end
				#println("a = $a")
				#println("b = $b")
				f = complex(a,b)
				t = n/f
				#println("f = $f")
				#println("t = $t")
				if round(t)==t
					d = true
				else
					f = conj(f); t = n/f
					#println("f = $f")
					#println("t = $t")
					if round(t)==t; d = true end
				end #if round(t)!=t
				#println("d = $d")
						#l = [l f]; f = b-a*im; t = n/(f)

				#else
					#l = [l (a+b*im)]; f = a-b*im; t = n/((a+b*im)*(a-b*im))
				#end

			#else
			end #for i in 1:length(P[:,1])
			if !d; f = n; t = 1+0im end
			#println("f = $f")
			#println("t = $t")
		end #if L[p]==2
	if round(t)==t; l = [l f]; n = complex(Int(real(t)),Int(imag(t))) end


	#println("l = $l")
	end #for p in 2:length(L)
	#l = l[:,2:end]; 
	if n != 1+0im; l = [n l] end
	#println("l = $l")
	return l
end #function listpfact(n::Complex)
function pfact(n::Complex)
	l = listpfact(n); s = ""; b = 1+0im; ex = 0
	for q in l
		if q == b; ex+=1
		else 
			if b!=1+0im; if ex==1; s = "$s$b, " else s="$s($b)^$ex, " end end
			b=q; ex=1; 
		end
	end
	if ex==1; s = "$s$b" else s="$s($b)^$ex" end
	return s
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
#for a in 5:6, for b in 5:6
#println("$(complex(a,b)) = $(listpfact(complex(a,b)))\n")
#end
#listpfact(complex(377+0im))
#println(listpfact(complex(361,-1767)))
# 361-1767im = (1+im)(2+im)(4+im)(19+0im)(-7-2im)
println(pfact(complex(18,26)))

println("Done!")