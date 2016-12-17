
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


architecture DataFlow of bcd_to_sevenseg is
	SIGNAL i0, i1, i2, i3 : STD_LOGIC;
	SIGNAL a, b, c, d, e, f, g : STD_LOGIC;
begin
	Segs(1) <= a;
	Segs(2) <= b;
	Segs(3) <= c;
	Segs(4) <= d;
	Segs(5) <= e;
	Segs(6) <= f;
	Segs(7) <= g;
	
	i0 <= I(0);
	i1 <= I(1);
	i2 <= I(2);
	i3 <= I(3);
	
	a <= i3 or i1 or (i2 xnor i0);
	b <= (not i2) or not (i1 xor i0);
	c <= i2 or (not i1) or i0;
	d <= (i1 and not i0) or (not i2 and not i0) or (not i2 and i1) or (i2 and not i1 and i0);
	e <= (i1 and not i0) or (not i2 and not i0);
	f <= i3 or (i2 and not i1) or (i2 and not i0) or (not i1 and not i0);
	g <= i3 or (i2 xor i1) or (i1 and not i0);

end DataFlow;

