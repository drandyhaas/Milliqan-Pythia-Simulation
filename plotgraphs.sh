#wget https://www.dropbox.com/s/q76sfinwimys77j/data14pt2.zip
#unzip data14pt2.zip
#rm data14pt2.zip

# ./plotgraphs.sh dataextra type rock dohist
#extra mode is for extensions (suffix) to data directories
#type mode is for pT cut type (0 for none, 1 for flat, and 2 for triangular)
#rock mode is for rock damping cut (0 for off, 1 for on)
#hist mode is for debugging hists (0 for off, 1 for on)

dohist=0 # make debugging histograms

root -b -l -q plotgraph.cc\(\"gammaZ$1\",$2,$3,$dohist\)
sleep 1
root -b -l -q plotgraph.cc\(\"onia$1\",$2,$3,$dohist\)
sleep 1
root -b -l -q plotgraph.cc\(\"qcd$1\",$2,$3,$dohist\)
sleep 1

nlay=4 # 1 (full eff), 3, or 4
root -l -q filleff.cc\($nlay\)

doqcd=1 # 0 or 1
bkg=0 # 0 (optimistic) or 1 (orig)

root -l -q plots/heatplotpTweight_type$2\_rock$3\_qcd$1.C plots/heatplotpTweighterr_type$2\_rock$3\_qcd$1.C plots/heatplotpTweight_type$2\_rock$3\_onia$1.C plots/heatplotpTweighterr_type$2\_rock$3\_onia$1.C plots/heatplotpTweight_type$2\_rock$3\_gammaZ$1.C plots/heatplotpTweighterr_type$2\_rock$3\_gammaZ$1.C plots/eff${nlay}.C limitplot.cc\($doqcd,$bkg,\"$1\"\,$2,$3\)
