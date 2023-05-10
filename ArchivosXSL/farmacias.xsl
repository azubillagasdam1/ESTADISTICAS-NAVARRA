<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

        <svg xmlns="http://www.w3.org/2000/svg" width="1180" height="858">
            <image href="mapaNavarra2.jpg" x="0" y="0"
                   width="1180" height="858"/>

            <xsl:for-each select="data/row">
                <xsl:variable name="GEORR_X" select="GEORR_X"/>
                <xsl:variable name="GEORR_Y" select="GEORR_Y"/>

                <circle r="10" cx="{$GEORR_X * (26945.037) - (1153228.434)}" cy="{ (-11338.67) - $GEORR_Y *  (7091.824)}" fill="red"/>

            </xsl:for-each>
            <circle r="10" cx="480" cy="415" fill="red"/>
            <circle r="10" cx="795" cy="350" fill="red"/>
        </svg>

    </xsl:template>
</xsl:stylesheet>


        <!-- CordenadasMaps lugar1:(42.80609319719878, -1.679884302112502   )
                Cordenadas pixeles lugar1: (200,550)
        -->
        <!-- CordenadasMaps lugar2:(42.82586487491527,-1.6306587456643036)
                        Cordenadas pixeles lugar2: (777,220)-->



        <!-- relacion cordX1: 200 - 777 = -577
            relacion mapaX1: 42.80609319719878 - 42.82586487491527 = -0.01977167771649

            Calculo X : -577/-0.01977167771649 = 29183.1582667751922833

            relacion cordY1: 550 - 220 = 330
            relacion mapaY1: -1.679884302112502 - -1.6306587456643036 = -0.0492255564481984

            Calculo Y : 330/-0.0492255564481984 -6703.8348331779524015


            200 = 42.80609319719878 * ax -tx
            777 = 42.82586487491527 * ax -tx

            ax= 26945.037
            tx= 1153228.434

            ....cx = gx *  ax - tx
            cx = gx * 26945.037 - 1153228.434



            550 = vy - -1.679884302112502 * ay
            220 = vy - -1.6306587456643036 * ay

            ....cy = vy - gy * ay
            vy = -10711.667   ay = -6703.835

            prueba 3

           LM1: (42.81812166838187, -1.6433480559640912)
           LP1: (635, 340)

             LM2: (42.804205740007106, -1.6753288152122408)
           LP2: (260, 570)
           ++++++++++++++++++++++++++++++++
           635 = 42.81812166838187 * ax -tx
           260 = 42.804205740007106 * ax -tx

           ax= 26947.537
           tx= 1153207.934

           cx = gx *  ax - tx
           cx = gx * 26947.537 - 1153207.934

           +++++++++++++++++++++++++++++++++
            340 = vy - -1.6433480559640912 * ay
            570 = vy - -1.6753288152122408 * ay

            vy = -11338.67
            ay = -7091.824

            cy = vy - gy * ay
            cy = -11338.67 - gy * -7091.824







            -->