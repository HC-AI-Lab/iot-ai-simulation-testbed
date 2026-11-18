<simconf version="2023090101">
  <simulation>
    <title>N100_topo16</title>
    <randomseed>10016</randomseed>
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
          <pos x="136.7" y="18.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>2</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="204.7" y="52.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>3</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="102.3" y="214.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>4</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="248.0" y="37.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>5</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="44.2" y="159.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>6</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="229.5" y="66.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>7</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="122.4" y="212.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>8</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="274.9" y="105.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>9</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="51.1" y="96.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>10</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="146.7" y="121.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>11</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="287.8" y="76.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>12</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="127.5" y="159.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>13</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="41.7" y="297.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>14</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="57.2" y="152.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>15</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="59.0" y="171.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>16</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="99.0" y="100.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>17</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="253.9" y="49.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>18</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="250.3" y="234.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>19</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="16.2" y="113.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>20</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="108.1" y="228.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>21</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="248.0" y="92.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>22</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="190.3" y="241.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>23</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="205.8" y="65.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>24</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="8.1" y="297.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>25</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="124.4" y="102.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>26</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="213.1" y="290.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>27</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="112.0" y="185.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>28</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="265.3" y="161.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>29</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="237.1" y="261.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>30</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="57.4" y="191.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>31</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="10.8" y="128.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>32</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="40.5" y="173.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>33</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="123.6" y="267.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>34</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="1.0" y="157.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>35</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="9.8" y="120.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>36</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="167.0" y="22.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>37</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="180.5" y="94.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>38</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="258.7" y="100.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>39</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="255.2" y="48.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>40</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="152.5" y="228.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>41</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="247.8" y="36.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>42</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="217.4" y="106.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>43</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="32.9" y="35.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>44</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="201.9" y="200.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>45</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="232.9" y="211.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>46</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="167.6" y="38.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>47</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="280.7" y="136.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>48</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="77.2" y="74.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>49</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="139.2" y="16.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>50</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="115.6" y="88.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>51</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="149.4" y="252.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>52</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="95.5" y="266.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>53</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="77.7" y="229.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>54</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="106.4" y="202.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>55</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="51.2" y="126.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>56</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="115.3" y="236.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>57</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="31.7" y="19.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>58</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="44.6" y="136.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>59</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="245.3" y="1.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>60</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="239.3" y="278.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>61</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="140.4" y="54.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>62</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="288.1" y="283.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>63</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="150.3" y="243.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>64</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="89.6" y="3.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>65</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="15.6" y="289.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>66</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="223.7" y="276.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>67</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="267.4" y="93.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>68</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="29.0" y="8.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>69</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="225.4" y="125.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>70</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="91.5" y="4.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>71</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="134.6" y="175.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>72</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="248.4" y="279.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>73</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="81.9" y="288.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>74</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="30.3" y="176.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>75</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="181.6" y="131.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>76</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="52.1" y="188.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>77</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="269.8" y="142.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>78</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="49.5" y="179.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>79</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="14.0" y="210.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>80</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="119.3" y="35.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>81</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="14.9" y="204.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>82</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="192.6" y="159.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>83</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="234.1" y="230.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>84</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="185.7" y="63.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>85</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="122.5" y="31.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>86</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="199.0" y="84.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>87</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="61.9" y="193.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>88</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="209.0" y="268.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>89</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="281.7" y="297.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>90</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="172.6" y="19.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>91</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="93.4" y="143.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>92</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="293.4" y="296.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>93</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="45.9" y="152.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>94</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="97.6" y="106.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>95</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="264.6" y="62.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>96</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="122.1" y="195.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>97</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="111.3" y="90.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>98</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="161.8" y="226.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>99</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="189.3" y="248.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>100</id>
          </interface_config>
        </mote>
      </motetype>
    <description>placement_seed=10016; sim_seed=10016; W=300.0; H=300.0; tx=150.0; int=160.0
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
