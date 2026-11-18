<simconf version="2023090101">
  <simulation>
    <title>N100_topo31</title>
    <randomseed>10031</randomseed>
    <motedelay_us>1000000</motedelay_us>
    <radiomedium>
      org.contikios.cooja.radiomediums.UDGM
      <transmitting_range>150.0</transmitting_range>
      <interference_range>160.0</interference_range>
      <success_ratio_tx>1.0</success_ratio_tx>
      <success_ratio_rx>1.0</success_ratio_rx>
      </radiomedium>
    <motetype>
      org.contikios.cooja.contikimote.ContikiMoteType
      <description>Cooja Sink Mote</description>
      <source>[CONFIG_DIR]/sink.c</source>
      <commands>$(MAKE) -j$(CPUS) sink.cooja TARGET=cooja</commands>
      <moteinterface>org.contikios.cooja.interfaces.Position</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiMoteID</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiRS232</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.IPAddress</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiRadio</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiClock</moteinterface>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="150.0" y="0.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>1</id>
          </interface_config>
        </mote>
      </motetype>
    <motetype>
      org.contikios.cooja.contikimote.ContikiMoteType
      <description>Cooja Node Mote</description>
      <source>[CONFIG_DIR]/node.c</source>
      <commands>$(MAKE) -j$(CPUS) node.cooja TARGET=cooja</commands>
      <moteinterface>org.contikios.cooja.interfaces.Position</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiMoteID</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiRS232</moteinterface>
      <moteinterface>org.contikios.cooja.interfaces.IPAddress</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiRadio</moteinterface>
      <moteinterface>org.contikios.cooja.contikimote.interfaces.ContikiClock</moteinterface>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="105.8" y="298.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>2</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="217.8" y="44.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>3</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="65.3" y="40.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>4</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="46.8" y="179.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>5</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="247.0" y="46.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>6</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="79.0" y="208.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>7</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="100.0" y="270.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>8</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="87.1" y="231.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>9</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="252.2" y="244.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>10</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="125.9" y="279.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>11</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="64.5" y="15.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>12</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="111.4" y="162.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>13</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="212.2" y="190.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>14</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="60.7" y="264.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>15</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="57.4" y="83.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>16</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="194.0" y="206.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>17</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="61.7" y="66.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>18</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="63.9" y="165.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>19</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="232.9" y="267.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>20</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="279.8" y="4.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>21</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="269.8" y="81.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>22</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="49.1" y="102.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>23</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="127.8" y="186.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>24</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="177.3" y="39.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>25</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="225.1" y="297.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>26</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="164.3" y="7.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>27</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="225.0" y="291.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>28</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="271.1" y="216.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>29</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="236.5" y="113.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>30</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="106.7" y="119.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>31</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="277.2" y="58.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>32</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="190.5" y="205.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>33</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="89.9" y="33.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>34</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="193.5" y="44.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>35</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="131.8" y="298.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>36</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="230.8" y="0.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>37</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="17.9" y="93.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>38</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="13.4" y="263.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>39</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="295.6" y="106.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>40</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="188.1" y="127.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>41</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="31.4" y="207.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>42</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="134.2" y="49.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>43</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="31.8" y="205.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>44</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="242.7" y="0.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>45</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="141.3" y="253.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>46</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="140.8" y="112.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>47</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="54.6" y="65.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>48</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="184.4" y="275.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>49</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="91.7" y="181.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>50</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="80.5" y="13.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>51</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="39.8" y="86.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>52</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="96.5" y="39.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>53</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="105.5" y="33.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>54</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="139.7" y="46.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>55</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="50.4" y="186.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>56</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="213.0" y="286.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>57</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="138.8" y="194.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>58</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="32.1" y="236.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>59</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="126.6" y="129.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>60</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="172.1" y="4.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>61</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="264.5" y="218.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>62</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="98.5" y="268.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>63</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="32.9" y="213.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>64</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="60.4" y="258.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>65</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="260.8" y="259.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>66</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="77.8" y="156.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>67</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="18.1" y="55.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>68</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="110.9" y="268.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>69</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="229.8" y="74.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>70</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="204.0" y="195.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>71</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="288.1" y="294.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>72</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="88.2" y="62.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>73</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="252.1" y="234.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>74</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="81.6" y="222.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>75</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="62.1" y="269.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>76</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="50.2" y="254.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>77</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="140.2" y="92.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>78</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="187.9" y="112.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>79</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="286.1" y="270.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>80</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="234.6" y="45.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>81</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="31.3" y="70.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>82</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="266.3" y="134.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>83</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="9.9" y="272.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>84</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="2.5" y="19.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>85</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="244.9" y="175.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>86</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="165.1" y="45.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>87</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="40.2" y="233.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>88</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="290.5" y="175.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>89</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="251.0" y="197.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>90</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="102.0" y="45.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>91</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="295.3" y="92.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>92</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="133.2" y="190.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>93</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="140.0" y="40.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>94</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="295.8" y="232.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>95</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="28.4" y="171.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>96</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="136.3" y="19.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>97</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="122.7" y="205.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>98</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="14.6" y="296.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>99</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="140.9" y="65.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>100</id>
          </interface_config>
        </mote>
      </motetype>
    <description>placement_seed=10031; sim_seed=10031; W=300.0; H=300.0; tx=150.0; int=160.0
</description>
    </simulation>
  <plugin control="true">
    org.contikios.cooja.plugins.ScriptRunner
    <plugin_config>
      <scriptfile>[CONFIG_DIR]/simulation.js</scriptfile>
      <active>true</active>
      </plugin_config>
    </plugin>
  </simconf>
