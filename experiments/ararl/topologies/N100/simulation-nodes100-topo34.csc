<simconf version="2023090101">
  <simulation>
    <title>N100_topo34</title>
    <randomseed>10034</randomseed>
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
          <pos x="151.8" y="221.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>2</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="241.7" y="231.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>3</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="184.3" y="298.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>4</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="13.9" y="197.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>5</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="263.9" y="295.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>6</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="127.0" y="277.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>7</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="110.6" y="255.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>8</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="190.1" y="118.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>9</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="56.3" y="67.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>10</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="179.1" y="271.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>11</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="1.1" y="20.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>12</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="289.4" y="262.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>13</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="51.7" y="100.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>14</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="128.7" y="147.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>15</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="141.4" y="109.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>16</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="5.4" y="71.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>17</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="257.9" y="76.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>18</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="155.2" y="234.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>19</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="18.0" y="139.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>20</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="58.8" y="8.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>21</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="293.1" y="125.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>22</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="64.1" y="11.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>23</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="110.8" y="5.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>24</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="247.4" y="58.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>25</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="121.4" y="167.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>26</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="101.4" y="207.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>27</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="230.9" y="265.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>28</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="80.9" y="32.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>29</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="21.0" y="175.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>30</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="169.3" y="105.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>31</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="209.7" y="274.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>32</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="77.5" y="41.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>33</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="220.5" y="240.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>34</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="39.6" y="199.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>35</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="35.7" y="262.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>36</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="206.6" y="28.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>37</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="138.9" y="287.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>38</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="125.4" y="1.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>39</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="154.1" y="283.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>40</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="147.0" y="231.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>41</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="146.2" y="120.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>42</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="113.9" y="57.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>43</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="204.2" y="76.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>44</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="253.3" y="146.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>45</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="214.6" y="208.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>46</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="192.3" y="1.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>47</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="235.4" y="88.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>48</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="241.1" y="253.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>49</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="129.7" y="250.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>50</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="187.1" y="18.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>51</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="5.2" y="170.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>52</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="176.3" y="175.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>53</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="158.9" y="171.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>54</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="129.6" y="158.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>55</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="147.7" y="33.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>56</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="71.8" y="133.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>57</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="299.0" y="159.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>58</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="159.9" y="10.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>59</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="110.8" y="144.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>60</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="18.3" y="112.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>61</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="3.7" y="244.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>62</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="179.8" y="91.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>63</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="92.6" y="280.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>64</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="66.3" y="119.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>65</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="33.1" y="19.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>66</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="16.2" y="134.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>67</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="37.9" y="171.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>68</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="217.5" y="81.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>69</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="253.5" y="193.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>70</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="222.6" y="127.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>71</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="105.3" y="262.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>72</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="107.2" y="292.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>73</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="48.7" y="69.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>74</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="67.9" y="163.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>75</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="132.8" y="113.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>76</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="229.6" y="22.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>77</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="148.7" y="13.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>78</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="64.4" y="70.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>79</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="134.4" y="285.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>80</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="74.1" y="244.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>81</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="298.5" y="255.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>82</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="147.9" y="9.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>83</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="209.5" y="289.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>84</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="26.3" y="224.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>85</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="293.3" y="259.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>86</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="284.9" y="264.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>87</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="16.4" y="15.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>88</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="184.4" y="49.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>89</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="141.9" y="82.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>90</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="183.3" y="284.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>91</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="208.5" y="84.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>92</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="61.3" y="112.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>93</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="245.2" y="113.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>94</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="178.4" y="283.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>95</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="275.0" y="1.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>96</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="169.2" y="191.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>97</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="192.6" y="100.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>98</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="22.4" y="296.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>99</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="36.7" y="230.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>100</id>
          </interface_config>
        </mote>
      </motetype>
    <description>placement_seed=10034; sim_seed=10034; W=300.0; H=300.0; tx=150.0; int=160.0
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
