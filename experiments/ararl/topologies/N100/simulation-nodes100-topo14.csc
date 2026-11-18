<simconf version="2023090101">
  <simulation>
    <title>N100_topo14</title>
    <randomseed>10014</randomseed>
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
          <pos x="126.0" y="166.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>2</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="293.6" y="69.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>3</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="167.3" y="20.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>4</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="261.7" y="218.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>5</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="246.8" y="228.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>6</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="222.7" y="299.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>7</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="99.6" y="216.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>8</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="99.8" y="279.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>9</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="187.6" y="81.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>10</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="89.6" y="224.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>11</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="195.6" y="78.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>12</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="37.0" y="133.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>13</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="282.8" y="222.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>14</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="11.6" y="289.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>15</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="260.8" y="169.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>16</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="129.6" y="226.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>17</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="67.6" y="128.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>18</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="230.2" y="135.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>19</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="180.7" y="60.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>20</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="84.4" y="229.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>21</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="102.7" y="176.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>22</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="170.1" y="202.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>23</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="120.3" y="84.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>24</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="294.5" y="88.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>25</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="274.5" y="99.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>26</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="87.0" y="108.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>27</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="33.0" y="53.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>28</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="32.3" y="149.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>29</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="63.3" y="111.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>30</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="188.5" y="80.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>31</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="48.2" y="123.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>32</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="258.3" y="230.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>33</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="121.1" y="282.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>34</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="240.4" y="87.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>35</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="266.5" y="139.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>36</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="63.9" y="8.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>37</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="226.6" y="216.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>38</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="95.7" y="5.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>39</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="172.0" y="234.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>40</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="231.4" y="184.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>41</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="33.6" y="240.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>42</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="107.8" y="228.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>43</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="126.6" y="266.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>44</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="159.9" y="242.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>45</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="214.8" y="231.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>46</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="206.8" y="191.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>47</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="26.6" y="215.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>48</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="76.2" y="117.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>49</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="42.2" y="123.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>50</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="219.1" y="18.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>51</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="59.1" y="286.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>52</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="70.2" y="213.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>53</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="279.4" y="44.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>54</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="189.8" y="211.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>55</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="169.7" y="195.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>56</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="228.0" y="148.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>57</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="108.2" y="45.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>58</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="213.3" y="143.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>59</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="16.6" y="64.4" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>60</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="125.9" y="266.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>61</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="41.8" y="45.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>62</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="295.4" y="40.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>63</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="185.1" y="132.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>64</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="285.2" y="122.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>65</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="33.3" y="237.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>66</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="32.8" y="234.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>67</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="170.4" y="38.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>68</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="184.4" y="235.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>69</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="35.6" y="154.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>70</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="36.3" y="275.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>71</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="165.9" y="8.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>72</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="153.5" y="176.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>73</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="77.9" y="231.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>74</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="153.4" y="95.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>75</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="26.0" y="282.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>76</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="12.1" y="254.6" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>77</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="56.2" y="217.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>78</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="16.9" y="284.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>79</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="234.5" y="247.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>80</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="137.9" y="255.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>81</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="133.7" y="192.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>82</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="175.2" y="247.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>83</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="144.9" y="81.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>84</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="9.9" y="269.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>85</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="226.2" y="247.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>86</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="61.6" y="289.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>87</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="16.5" y="130.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>88</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="67.0" y="162.0" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>89</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="117.4" y="229.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>90</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="68.2" y="145.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>91</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="148.1" y="119.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>92</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="229.5" y="299.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>93</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="165.8" y="102.1" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>94</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="283.4" y="236.7" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>95</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="144.1" y="146.3" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>96</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="23.4" y="90.9" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>97</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="59.4" y="79.5" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>98</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="279.0" y="16.8" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>99</id>
          </interface_config>
        </mote>
      <mote>
        <interface_config>
          org.contikios.cooja.interfaces.Position
          <pos x="84.8" y="160.2" />
          </interface_config>
        <interface_config>
          org.contikios.cooja.contikimote.interfaces.ContikiMoteID
          <id>100</id>
          </interface_config>
        </mote>
      </motetype>
    <description>placement_seed=10014; sim_seed=10014; W=300.0; H=300.0; tx=150.0; int=160.0
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
