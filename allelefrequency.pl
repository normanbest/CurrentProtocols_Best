#!usr/bin/perl -w

use strict;
use warnings;

my $filein = "CDS_pileup_variant_noindels.vcf.vcf";
my $fileout1 = "allelefreq_chr1.tsv";
my $fileout2 = "allelefreq_chr2.tsv";
my $fileout3 = "allelefreq_chr3.tsv";
my $fileout4 = "allelefreq_chr4.tsv";
my $fileout5 = "allelefreq_chr5.tsv";
my $fileout6 = "allelefreq_chr6.tsv";
my $fileout7 = "allelefreq_chr7.tsv";
my $fileout8 = "allelefreq_chr8.tsv";
my $fileout9 = "allelefreq_chr9.tsv";
my $fileout10 = "allelefreq_chr10.tsv";


my $counter1;
my $counter2;
my $counter3;
my $counter4;
my $counter5;
my $counter6;
my $counter7;
my $counter8;
my $counter9;
my $counter10;
my $chr;
my $pos;
my $dot1;
my $refAL;
my $altAL;
my $qual;
my $dot2;
my $info1;
my $info2;
my $info3;

my $before1;
my $after1;
my $before2;
my $after2;

my $Fref;
my $Rref;
my $Falt;
my $Ralt;
my $FAD;
my $RAD;
my $ref;
my $alt;
my $DP;
my $Freq;
my @dodgerswin1;
my @dodgerswin2;
my @dodgerswin3;
my @dodgerswin4;
my @dodgerswin5;
my @dodgerswin6;
my @dodgerswin7;
my @dodgerswin8;
my @dodgerswin9;
my @dodgerswin10;


open FILE1, "<" , "$filein" or die;

while (my $line =<FILE1>) {
    
    chomp $line;
    
    if ($line =~ /^\d/){
        
        if ($line =~ /DP4/){
            
            ($chr, $pos, $dot1, $refAL, $altAL, $qual, $dot2, $info1, $info2, $info3) = split "\t", $line, 10;
            
            $info3 =~ s/\r|\n//g;
            
            ($before1, $after1) = split "DP4=", $info1, 2;
            
            ($before2, $after2) = split ";", $after1, 2;
            
            ($Fref, $Rref, $Falt, $Ralt) = split ",", $before2, 4;
            
            $FAD = $Fref + $Falt;
            
            $RAD = $Rref + $Ralt;
            
            $ref = $Fref + $Rref;
            
            $alt = $Falt + $Ralt;
            
            $DP = $Fref + $Rref + $Falt + $Ralt;
            
            $Freq = $alt / $DP;
                
            if ($FAD >=2){
                    
                if ($RAD >=2){
                    
					if($chr == 1){
						$counter1++;
                        
						push @dodgerswin1, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 2){
						$counter2++;
                        
						push @dodgerswin2, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 3){
						$counter3++;
                        
						push @dodgerswin3, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 4){
						$counter4++;
                        
						push @dodgerswin4, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 5){
						$counter5++;
                        
						push @dodgerswin5, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 6){
						$counter6++;
                        
						push @dodgerswin6, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 7){
						$counter7++;
                        
						push @dodgerswin7, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 8){
						$counter8++;
                        
						push @dodgerswin8, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 9){
						$counter9++;
                        
						push @dodgerswin9, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
					if($chr == 10){
						$counter10++;
                        
						push @dodgerswin10, {"chr" => $chr, "pos" => $pos, "DP" => $DP, "ref" => $ref, "alt" => $alt, "Freq" => $Freq}; 
					}
				}
            }
        }
    }
}
close (FILE1);

#CHR1
open FILE2, ">", $fileout1 or die;

print FILE2 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter1; $i++){
    
    print FILE2 "$dodgerswin1[$i]{chr}\t$dodgerswin1[$i]{pos}\t$dodgerswin1[$i]{Freq}\n";
}

close (FILE2);

#CHR2
open FILE3, ">", $fileout2 or die;

print FILE3 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter2; $i++){
    
    print FILE3 "$dodgerswin2[$i]{chr}\t$dodgerswin2[$i]{pos}\t$dodgerswin2[$i]{Freq}\n";
}

close (FILE3);

#CHR3
open FILE4, ">", $fileout3 or die;

print FILE4 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter3; $i++){
    
    print FILE4 "$dodgerswin3[$i]{chr}\t$dodgerswin3[$i]{pos}\t$dodgerswin3[$i]{Freq}\n";
}

close (FILE4);

#CHR4
open FILE5, ">", $fileout4 or die;

print FILE5 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter4; $i++){
    
    print FILE5 "$dodgerswin4[$i]{chr}\t$dodgerswin4[$i]{pos}\t$dodgerswin4[$i]{Freq}\n";
}

close (FILE5);

#CHR5
open FILE6, ">", $fileout5 or die;

print FILE6 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter5; $i++){
    
    print FILE6 "$dodgerswin5[$i]{chr}\t$dodgerswin5[$i]{pos}\t$dodgerswin5[$i]{Freq}\n";
}

close (FILE6);

#CHR6
open FILE7, ">", $fileout6 or die;

print FILE7 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter6; $i++){
    
    print FILE7 "$dodgerswin6[$i]{chr}\t$dodgerswin6[$i]{pos}\t$dodgerswin6[$i]{Freq}\n";
}

close (FILE7);

#CHR7
open FILE8, ">", $fileout7 or die;

print FILE8 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter7; $i++){
    
    print FILE8 "$dodgerswin7[$i]{chr}\t$dodgerswin7[$i]{pos}\t$dodgerswin7[$i]{Freq}\n";
}

close (FILE8);

#CHR8
open FILE9, ">", $fileout8 or die;

print FILE9 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter8; $i++){
    
    print FILE9 "$dodgerswin8[$i]{chr}\t$dodgerswin8[$i]{pos}\t$dodgerswin8[$i]{Freq}\n";
}

close (FILE9);

#CHR9
open FILE10, ">", $fileout9 or die;

print FILE10 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter9; $i++){
    
    print FILE10 "$dodgerswin9[$i]{chr}\t$dodgerswin9[$i]{pos}\t$dodgerswin9[$i]{Freq}\n";
}

close (FILE10);

#CHR10
open FILE11, ">", $fileout10 or die;

print FILE11 "CHR\tPOS\tFREQ\n";


for (my $i=0; $i<$counter10; $i++){
    
    print FILE11 "$dodgerswin10[$i]{chr}\t$dodgerswin10[$i]{pos}\t$dodgerswin10[$i]{Freq}\n";
}

close (FILE11);

exit
    


