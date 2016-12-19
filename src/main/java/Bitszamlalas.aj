public aspect Bitszamlalas {
	static int egyes=0;
	static int nullas=0;

	pointcut bitszamol(char a): call(* udprog.vedes1.LZWBinFa.egyBitFeldolg(char)) && args(a);
	pointcut kiiratas(): call(* udprog.vedes1.LZWBinFa.getSzoras());
	
	before(char a) : bitszamol(a)
	{		
	if(a == '0') nullas++;
	else 
		if(a == '1') egyes++;
		/*System.out.println("Nullas: " + nullas);
		System.out.println("Egyes: " + egyes);
		System.out.println("--------------");*/
	}
	after(): kiiratas()
	{
		System.out.println("--------------");
		System.out.println("Nullas: " + nullas);
		System.out.println("Egyes: " + egyes);
		System.out.println("Egyes relativ gyakorisaga: " + ((double) egyes/((double) egyes+(double) nullas)));
		System.out.println("Nullas relativ gyakorisaga: " + ((double) nullas/((double) egyes+(double) nullas)));
		System.out.println("SUM: " + (egyes+nullas));
	}

}
